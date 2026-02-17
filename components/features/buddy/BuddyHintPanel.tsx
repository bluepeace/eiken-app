"use client";

import { useEffect, useState } from "react";
import { getCurrentUserBuddy } from "@/lib/data/buddies";

export interface BuddyHintPanelProps {
  /** パネル見出し（例: ヒント（英検2級 英作文）） */
  title: string;
  /** ヒント本文 */
  hintContent: string;
  isOpen: boolean;
  onClose: () => void;
  /** 吹き出しのアクセント（writing: 緑, reading: ティール） */
  accent?: "writing" | "reading";
}

const ACCENT_STYLES = {
  writing: "bg-[#A6D472]/15 ring-[#A6D472]/40",
  reading: "bg-[#50c2cb]/15 ring-[#50c2cb]/40"
};

export function BuddyHintPanel({
  title,
  hintContent,
  isOpen,
  onClose,
  accent = "reading"
}: BuddyHintPanelProps) {
  const [buddy, setBuddy] = useState<{ id: string; name: string; image_url: string } | null>(null);
  const [buddyLoaded, setBuddyLoaded] = useState(false);

  useEffect(() => {
    if (!isOpen) return;
    let mounted = true;
    getCurrentUserBuddy().then((b) => {
      if (!mounted) return;
      setBuddy(b);
      setBuddyLoaded(true);
    });
    return () => { mounted = false; };
  }, [isOpen]);

  useEffect(() => {
    if (isOpen) {
      const handleEscape = (e: KeyboardEvent) => {
        if (e.key === "Escape") onClose();
      };
      document.addEventListener("keydown", handleEscape);
      document.body.style.overflow = "hidden";
      return () => {
        document.removeEventListener("keydown", handleEscape);
        document.body.style.overflow = "";
      };
    }
  }, [isOpen, onClose]);

  const accentStyle = ACCENT_STYLES[accent];

  return (
    <>
      {isOpen && (
        <div
          className="fixed inset-0 z-40 bg-slate-900/20 backdrop-blur-[1px] md:bg-transparent md:backdrop-blur-none"
          onClick={onClose}
          aria-hidden
        />
      )}

      <aside
        className={`fixed right-0 top-0 z-50 h-full w-full max-w-md transform bg-white shadow-xl transition-transform duration-300 ease-out md:max-w-sm ${
          isOpen ? "translate-x-0" : "translate-x-full"
        }`}
        aria-label={title}
      >
        <div className="flex h-full flex-col">
          <div className="flex items-center justify-between border-b border-slate-200 px-4 py-3">
            <h2 className="text-base font-semibold text-slate-900">{title}</h2>
            <button
              type="button"
              onClick={onClose}
              className="rounded-full p-2 text-slate-500 hover:bg-slate-100 hover:text-slate-700"
              aria-label="ヒントを閉じる"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                strokeWidth="2"
                className="h-5 w-5"
              >
                <path d="M18 6L6 18M6 6l12 12" />
              </svg>
            </button>
          </div>

          <div className="flex-1 overflow-y-auto px-4 py-4">
            {buddyLoaded && buddy ? (
              <div className="flex flex-col gap-4">
                <p className="text-xs text-slate-500">
                  {buddy.name}からのヒントだよ。わからないときはここを見てね。
                </p>
                <div className={`flex flex-col gap-3 rounded-2xl p-4 ring-1 ${accentStyle}`}>
                  <div className="flex items-start gap-3">
                    <div className="h-12 w-12 shrink-0 overflow-hidden rounded-full border-2 border-white bg-slate-100 shadow">
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
                    <div className="min-w-0 flex-1 pt-0.5">
                      <pre className="whitespace-pre-wrap font-sans text-sm leading-relaxed text-slate-700">
                        {hintContent}
                      </pre>
                    </div>
                  </div>
                </div>
              </div>
            ) : (
              <div className={`rounded-2xl p-4 ring-1 ${accentStyle}`}>
                <pre className="whitespace-pre-wrap font-sans text-sm leading-relaxed text-slate-700">
                  {hintContent}
                </pre>
              </div>
            )}
          </div>
        </div>
      </aside>
    </>
  );
}
