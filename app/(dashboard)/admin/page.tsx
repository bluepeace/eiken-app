import Link from "next/link";

export default function AdminPage() {
  return (
    <div>
      <h1 className="mb-6 text-xl font-semibold text-slate-100">管理画面</h1>
      <div className="grid gap-4 sm:grid-cols-2">
        <Link
          href="/admin/dashboard"
          className="rounded-xl border border-slate-700 bg-slate-900/50 p-6 transition hover:border-brand-500/50 hover:bg-slate-800/50"
        >
          <h2 className="mb-2 font-medium text-slate-200">問題数ダッシュボード</h2>
          <p className="text-sm text-slate-400">
            単語・ライティング・リーディングの級別問題数
          </p>
        </Link>
        <Link
          href="/admin/settings"
          className="rounded-xl border border-slate-700 bg-slate-900/50 p-6 transition hover:border-brand-500/50 hover:bg-slate-800/50"
        >
          <h2 className="mb-2 font-medium text-slate-200">基本設定</h2>
          <p className="text-sm text-slate-400">
            管理者メール・英検試験日
          </p>
        </Link>
        <Link
          href="/admin/users"
          className="rounded-xl border border-slate-700 bg-slate-900/50 p-6 transition hover:border-brand-500/50 hover:bg-slate-800/50"
        >
          <h2 className="mb-2 font-medium text-slate-200">ユーザー管理</h2>
          <p className="text-sm text-slate-400">
            登録ユーザーの一覧・詳細・編集
          </p>
        </Link>
        <Link
          href="/admin/vocabulary"
          className="rounded-xl border border-slate-700 bg-slate-900/50 p-6 transition hover:border-brand-500/50 hover:bg-slate-800/50"
        >
          <h2 className="mb-2 font-medium text-slate-200">単語管理</h2>
          <p className="text-sm text-slate-400">
            単語の登録・編集・削除
          </p>
        </Link>
        <Link
          href="/admin/writing"
          className="rounded-xl border border-slate-700 bg-slate-900/50 p-6 transition hover:border-brand-500/50 hover:bg-slate-800/50"
        >
          <h2 className="mb-2 font-medium text-slate-200">ライティング問題</h2>
          <p className="text-sm text-slate-400">
            英作文・Eメール・要約問題の登録・編集・削除
          </p>
        </Link>
        <Link
          href="/admin/avatars"
          className="rounded-xl border border-slate-700 bg-slate-900/50 p-6 transition hover:border-brand-500/50 hover:bg-slate-800/50"
        >
          <h2 className="mb-2 font-medium text-slate-200">アバター設定</h2>
          <p className="text-sm text-slate-400">
            アバターのプレセット管理
          </p>
        </Link>
        <Link
          href="/admin/backgrounds"
          className="rounded-xl border border-slate-700 bg-slate-900/50 p-6 transition hover:border-brand-500/50 hover:bg-slate-800/50"
        >
          <h2 className="mb-2 font-medium text-slate-200">背景設定</h2>
          <p className="text-sm text-slate-400">
            月別背景画像の管理
          </p>
        </Link>
      </div>
    </div>
  );
}
