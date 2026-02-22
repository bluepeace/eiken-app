"use client";

import { useEffect } from "react";

/**
 * Supabase auth-js が、コンポーネントのアンマウントや高速な画面遷移時に
 * 内部的に AbortError を投げることがある。
 * このエラーは unhandled promise rejection として表に出るため、
 * ここで握りつぶしてユーザーに表示しない。
 */
export function AbortErrorHandler() {
  useEffect(() => {
    const handler = (event: PromiseRejectionEvent) => {
      const err = event.reason;
      if (err instanceof Error && err.name === "AbortError") {
        event.preventDefault();
        event.stopPropagation();
      }
    };
    window.addEventListener("unhandledrejection", handler);
    return () => window.removeEventListener("unhandledrejection", handler);
  }, []);
  return null;
}
