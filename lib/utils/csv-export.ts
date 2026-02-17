/**
 * オブジェクト配列をCSV文字列に変換し、BOM付きでダウンロードする。
 * 検索・フィルタで絞り込んだ一覧をそのままCSV出力する想定。
 */

function escapeCsvCell(value: unknown): string {
  if (value === null || value === undefined) return "";
  const s = String(value);
  if (/[",\n\r]/.test(s)) {
    return `"${s.replace(/"/g, '""')}"`;
  }
  return s;
}

export type CsvColumn<T> = {
  key: keyof T | string;
  label: string;
  /** 値をCSV用文字列に変換（省略時は String(value) をエスケープ） */
  format?: (value: unknown, row: T) => string;
};

/**
 * オブジェクト配列からCSV文字列を生成する。
 * @param rows 行データの配列（絞り込み済みの一覧を渡す）
 * @param columns 列定義（key, label, 任意で format）
 */
export function buildCsv<T extends object>(
  rows: T[],
  columns: CsvColumn<T>[]
): string {
  const header = columns.map((c) => escapeCsvCell(c.label)).join(",");
  const body = rows
    .map((row) =>
      columns
        .map((col) => {
          const key = col.key as string;
          const value = (row as Record<string, unknown>)[key];
          if (col.format) return escapeCsvCell(col.format(value, row));
          return escapeCsvCell(value);
        })
        .join(",")
    )
    .join("\n");
  return `${header}\n${body}`;
}

/**
 * CSV文字列をBOM付きでダウンロードする。
 */
export function downloadCsv(filename: string, csvString: string): void {
  const bom = "\uFEFF";
  const blob = new Blob([bom + csvString], { type: "text/csv;charset=utf-8" });
  const url = URL.createObjectURL(blob);
  const a = document.createElement("a");
  a.href = url;
  a.download = filename;
  a.click();
  URL.revokeObjectURL(url);
}

/**
 * 絞り込み済みデータをCSVにし、その場でダウンロードする。
 */
export function exportToCsv<T extends object>(
  filename: string,
  rows: T[],
  columns: CsvColumn<T>[]
): void {
  const csv = buildCsv(rows, columns);
  downloadCsv(filename, csv);
}
