"use client";

import { useState, useEffect } from "react";
import { usePathname } from "next/navigation";
import { getCurrentUserBuddy, type Buddy } from "@/lib/data/buddies";
import { pickBuddyCommentForUser } from "@/lib/data/buddy-comments";
import { getProfileId } from "@/lib/data/vocabulary-db";
import { getStreak } from "@/lib/data/study-activity";

export function BuddyWidget() {
  const pathname = usePathname();
  const [buddy, setBuddy] = useState<Buddy | null>(null);
  const [comment, setComment] = useState("");
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    let mounted = true;
    const load = async () => {
      const b = await getCurrentUserBuddy();
      if (!mounted) return;
      setBuddy(b);
      if (!b) {
        setLoading(false);
        return;
      }
      const profileId = await getProfileId();
      const streak = profileId ? (await getStreak(profileId)).current : 0;
      const text = await pickBuddyCommentForUser(streak);
      if (mounted) setComment(text);
      setLoading(false);
    };
    void load();
    return () => { mounted = false; };
  }, [pathname]);

  const isHintPage =
    pathname.startsWith("/writing/essay") ||
    pathname.startsWith("/writing/email") ||
    pathname.startsWith("/writing/summary") ||
    pathname.startsWith("/reading/short") ||
    pathname.startsWith("/reading/conversation") ||
    pathname.startsWith("/reading/word-order");
  if (loading || !buddy || pathname.startsWith("/admin") || isHintPage) return null;

  return (
    <div
      className="fixed bottom-6 right-6 z-30 hidden md:flex flex-col items-end gap-0"
      aria-label={`${buddy.name}からのメッセージ`}
    >
      {/* 吹き出し（丸く可愛く） */}
      <div className="relative max-w-[240px] rounded-3xl bg-white/98 px-5 py-3.5 shadow-[0_4px_20px_rgba(80,194,203,0.18)] backdrop-blur-sm">
        <p className="font-zen-maru text-sm leading-relaxed text-slate-700">{comment}</p>
        {/* 吹き出しの尻尾（丸くて可愛い・バディ側へ） */}
        <div
          className="absolute -bottom-1 right-10 h-2.5 w-2.5 rotate-45 rounded-sm bg-white/98 shadow-[0_2px_6px_rgba(80,194,203,0.12)]"
          aria-hidden
        />
      </div>
      {/* バディ画像（少し大きめでその場にいる雰囲気） */}
      <div className="relative h-28 w-28 shrink-0 md:h-32 md:w-32">
        {/* eslint-disable-next-line @next/next/no-img-element */}
        <img
          src={buddy.image_url}
          alt=""
          className="h-full w-full object-contain object-bottom"
          onError={(e) => {
            (e.target as HTMLImageElement).src = "/logo-aiken.png";
          }}
        />
      </div>
    </div>
  );
}
