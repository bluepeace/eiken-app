"use client";

import { useEffect, useState } from "react";
import { supabase } from "@/lib/supabase/client";

/** 認証ページ用: スラッグがあれば企業ロゴ、なければデフォルト AiKen ロゴを表示 */
export function AuthOrgLogo({
  slug,
  className = "h-12 w-auto"
}: {
  slug: string | null | undefined;
  className?: string;
}) {
  const [logoUrl, setLogoUrl] = useState<string | null>(null);
  const [loading, setLoading] = useState(!!slug);

  useEffect(() => {
    if (!slug?.trim()) {
      setLogoUrl(null);
      setLoading(false);
      return;
    }
    let cancelled = false;
    setLoading(true);
    void (async () => {
      try {
        const { data } = await supabase
          .from("organizations")
          .select("logo_url")
          .eq("slug", slug.trim().toLowerCase())
          .maybeSingle();
        if (!cancelled) setLogoUrl((data?.logo_url as string) ?? null);
      } finally {
        if (!cancelled) setLoading(false);
      }
    })();
    return () => {
      cancelled = true;
    };
  }, [slug]);

  const src = logoUrl || "/logo-aiken.png";
  const alt = logoUrl ? "企業ロゴ" : "AiKen";

  if (loading) {
    return (
      <div
        className={`animate-pulse rounded bg-slate-200 ${className}`}
        aria-hidden
      />
    );
  }

  return (
    /* eslint-disable-next-line @next/next/no-img-element */
    <img
      src={src}
      alt={alt}
      className={className}
      onError={(e) => {
        (e.target as HTMLImageElement).src = "/logo-aiken.png";
      }}
    />
  );
}
