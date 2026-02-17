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
    pathname.startsWith("/reading/conversation");
  if (loading || !buddy || pathname.startsWith("/admin") || isHintPage) return null;

  return (
    <div
      className="fixed bottom-6 right-6 z-30 hidden md:flex flex-col items-end gap-0"
      aria-label={`${buddy.name}からのメッセージ`}
    >
      {/* 吹き出し（バディの上） */}
      <div className="relative max-w-[200px] rounded-2xl bg-white/95 px-4 py-2.5 shadow-lg ring-1 ring-slate-200/80 backdrop-blur-sm">
        <p className="text-sm leading-relaxed text-slate-800">{comment}</p>
        {/* 吹き出しの尻尾（下・右寄り） */}
        <div
          className="absolute -bottom-2 right-6 h-0 w-0 border-l-[10px] border-r-[10px] border-t-[12px] border-l-transparent border-r-transparent border-t-white/95"
          aria-hidden
        />
      </div>
      {/* バディ画像 */}
      <div className="relative h-16 w-16 shrink-0 overflow-hidden rounded-full border-2 border-white bg-slate-100 shadow-lg ring-2 ring-[#50c2cb]/30">
        {/* eslint-disable-next-line @next/next/no-img-element */}
        <img
          src={buddy.image_url}
          alt=""
          className="h-full w-full object-cover"
          onError={(e) => {
            (e.target as HTMLImageElement).src = "/logo-aiken.png";
          }}
        />
      </div>
    </div>
  );
}
