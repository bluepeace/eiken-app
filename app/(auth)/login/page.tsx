"use client";

import { Suspense } from "react";
import { useSearchParams } from "next/navigation";
import { LoginForm } from "@/components/LoginForm";

function LoginContent() {
  const searchParams = useSearchParams();
  const slug = searchParams.get("s");
  return <LoginForm slug={slug} />;
}

export default function LoginPage() {
  return (
    <Suspense fallback={
      <main className="flex min-h-[calc(100vh-64px)] items-center justify-center px-4 bg-slate-50">
        <p className="text-slate-600">読み込み中...</p>
      </main>
    }>
      <LoginContent />
    </Suspense>
  );
}
