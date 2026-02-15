import OpenAI from "openai";

/** ビルド時は OPENAI_API_KEY 未設定でもエラーにしない（Vercel で runtime に設定） */
const apiKey = process.env.OPENAI_API_KEY ?? "sk-placeholder-for-build";

export const openai = new OpenAI({
  apiKey,
  dangerouslyAllowBrowser: false
});

