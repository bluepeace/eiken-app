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
  writing:
    "bg-white/98 shadow-[0_4px_20px_rgba(166,212,114,0.2)]",
  reading:
    "bg-white/98 shadow-[0_4px_20px_rgba(80,194,203,0.2)]"
};

/** ヒント本文をパースし、・で始まる行は ul/li に、それ以外は段落に */
function renderHintContent(content: string) {
  const lines = content.split("\n");
  const nodes: React.ReactNode[] = [];
  let listItems: string[] = [];
  let index = 0;

  const flushList = () => {
    if (listItems.length > 0) {
      nodes.push(
        <ul
          key={`list-${index++}`}
          className="list-inside list-disc space-y-1 pl-1 text-sm text-slate-700"
        >
          {listItems.map((text, i) => (
            <li key={i}>{text}</li>
          ))}
        </ul>
      );
      listItems = [];
    }
  };

  for (let i = 0; i < lines.length; i++) {
    const line = lines[i];
    const trimmed = line.trim();
    const isBullet = trimmed.startsWith("・");

    if (isBullet && trimmed) {
      listItems.push(trimmed.replace(/^・\s*/, "").trim());
    } else {
      flushList();
      if (trimmed) {
        nodes.push(
          <p key={`p-${index++}`} className="text-sm leading-relaxed text-slate-700">
            {trimmed}
          </p>
        );
      }
    }
  }
  flushList();
  return (
    <div className="[&>p]:mt-2 [&>p:first-child]:mt-0 [&>ul]:mt-2 [&>ul:first-child]:mt-0">
      {nodes}
    </div>
  );
}

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

          <div className="flex flex-1 flex-col overflow-y-auto px-4 py-4">
            {buddyLoaded && buddy ? (
              <>
                <p className="text-xs text-slate-500">
                  {buddy.name}からのヒントだよ。わからないときはここを見てね。
                </p>
                {/* 吹き出し（バディがしゃべっている） */}
                <div className={`relative mt-3 rounded-3xl px-5 py-4 ${accentStyle}`}>
                  <div className="font-zen-maru text-slate-700">
                    {renderHintContent(hintContent)}
                  </div>
                  {/* 吹き出しの尻尾（下・バディ側） */}
                  <div
                    className="absolute -bottom-1.5 left-8 h-2.5 w-2.5 rotate-45 rounded-sm bg-white/98 shadow-[0_2px_6px_rgba(0,0,0,0.06)]"
                    aria-hidden
                  />
                </div>
                {/* バディ（吹き出しの外・その場にいる雰囲気） */}
                <div className="mt-4 flex justify-start">
                  <div className="h-20 w-20 shrink-0 md:h-24 md:w-24">
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
              </>
            ) : (
              <div className={`rounded-3xl px-5 py-4 ${accentStyle}`}>
                <div className="font-sans text-slate-700">
                  {renderHintContent(hintContent)}
                </div>
              </div>
            )}
          </div>
        </div>
      </aside>
    </>
  );
}
