/**
 * 英検単語CSVの修正・重複除去
 * - 4級: other 行の欠けている category を補う
 * - 3級: advice(動詞) -> advise に修正、誤字修正（がい代わりに -> が代わりに）
 * - 同じ word の重複を除去（初出を優先、意味・品詞が異なる場合は統合）
 */

const fs = require("fs");
const path = require("path");

function parseCSVLine(line) {
  const result = [];
  let current = "";
  let inQuotes = false;
  for (let i = 0; i < line.length; i++) {
    const c = line[i];
    if (c === '"') {
      inQuotes = !inQuotes;
    } else if ((c === "," && !inQuotes) || (c === "\n" && !inQuotes)) {
      result.push(current.trim());
      current = "";
      if (c === "\n") break;
    } else {
      current += c;
    }
  }
  if (current) result.push(current.trim());
  return result;
}

function escapeCSV(val) {
  if (val == null || val === "") return "";
  const s = String(val);
  return s.includes(",") || s.includes('"') ? `"${s.replace(/"/g, '""')}"` : s;
}

function run(inputPath, outputPath) {
  const content = fs.readFileSync(inputPath, "utf-8");
  const lines = content.split(/\r?\n/).filter((l) => l.trim());
  const header = parseCSVLine(lines[0]);
  const cols = ["level", "word", "meaning_ja", "Part_of_Speech", "category", "pronunciation", "example_en", "example_ja"];

  const seen = new Map();
  const rows = [];

  for (let i = 1; i < lines.length; i++) {
    let values = parseCSVLine(lines[i]);
    const row = {};
    header.forEach((h, j) => (row[h] = values[j] ?? ""));

    // 4級: other 行の修正（category が欠けている場合）
    let word = (row.word || "").trim();
    const cat = row.category || "";
    const pron = row.pronunciation || "";
    if (word === "other" && (cat.startsWith("/") || !cat)) {
      if (cat.startsWith("/")) {
        const exJa = row.example_en || row.example_ja || "";
        row.category = "数量";
        row.pronunciation = cat;
        row.example_en = pron;
        row.example_ja = exJa;
      } else {
        row.category = "数量";
      }
    }

    // 3級: advice(動詞) -> advise に修正（advice は名詞、advise が動詞）
    if (word === "advice" && (row.Part_of_Speech || "").includes("動詞")) {
      word = "advise";
      row.word = "advise";
    }

    // 誤字修正: がい代わりに -> が代わりに
    const exJaVal = row.example_ja || "";
    if (exJaVal.includes("がい代わりに")) {
      row.example_ja = exJaVal.replace(/がい代わりに/g, "が代わりに");
    }

    const wordKey = word.toLowerCase();
    if (!wordKey) continue;

    if (seen.has(wordKey)) {
      const firstIdx = seen.get(wordKey);
      const first = rows[firstIdx];
      const m = row.meaning_ja?.trim();
      if (m && first.meaning_ja !== m) {
        const parts = [first.meaning_ja, m].filter(Boolean);
        const unique = [...new Set(parts.flatMap((p) => p.split("・")))];
        first.meaning_ja = unique.join("・");
      }
      const posFirst = first.Part_of_Speech || "";
      const posCur = row.Part_of_Speech || "";
      if (posCur && posFirst !== posCur) {
        const merged = [...new Set([posFirst, posCur].flatMap((p) => p.split("・")))].join("・");
        first.Part_of_Speech = merged;
      }
      continue;
    }
    seen.set(wordKey, rows.length);
    rows.push(row);
  }

  const out = [cols.join(","), ...rows.map((r) => cols.map((c) => escapeCSV(r[c])).join(","))].join("\n");
  fs.writeFileSync(outputPath, out, "utf-8");
  console.log(`Input: ${lines.length - 1} rows -> Output: ${rows.length} rows (removed ${lines.length - 1 - rows.length} duplicates)`);
}

const inputPath = process.argv[2] || path.join(__dirname, "..", "data", "eiken_4kyu.csv");
const defaultOutput = (input) => {
  const name = path.basename(input, ".csv").replace(/_raw$/, "");
  return path.join(__dirname, "..", "data", (name.startsWith("eiken_") ? name : `eiken_${name}`) + ".csv");
};
const outputPath = process.argv[3] || defaultOutput(inputPath);

if (!fs.existsSync(inputPath)) {
  console.error("Input file not found:", inputPath);
  process.exit(1);
}

run(inputPath, outputPath);
