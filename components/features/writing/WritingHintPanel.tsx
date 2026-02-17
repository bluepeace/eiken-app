"use client";

import { getWritingHint, type WritingHintType } from "@/lib/writing-hints";
import { BuddyHintPanel } from "@/components/features/buddy/BuddyHintPanel";

interface WritingHintPanelProps {
  type: WritingHintType;
  level: string;
  isOpen: boolean;
  onClose: () => void;
}

export function WritingHintPanel({
  type,
  level,
  isOpen,
  onClose,
}: WritingHintPanelProps) {
  const hint = getWritingHint(type, level);
  const label =
    type === "essay" ? "英作文" : type === "summary" ? "要約" : "Eメール";

  return (
    <BuddyHintPanel
      title={`ヒント（英検${level} ${label}）`}
      hintContent={hint}
      isOpen={isOpen}
      onClose={onClose}
      accent="writing"
    />
  );
}

interface WritingHintButtonProps {
  onClick: () => void;
  isOpen?: boolean;
}

export function WritingHintButton({ onClick, isOpen }: WritingHintButtonProps) {
  return (
    <button
      type="button"
      onClick={onClick}
      className={`fixed bottom-6 right-6 z-30 flex items-center gap-2 rounded-full px-4 py-2.5 text-sm font-medium shadow-lg transition-all hover:shadow-xl ${
        isOpen
          ? "bg-[#A6D472] text-white hover:bg-[#8FC55C]"
          : "bg-white text-slate-700 ring-1 ring-slate-200 hover:bg-slate-50"
      }`}
      aria-label="ヒントを見る"
      aria-expanded={isOpen}
    >
      <svg
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 24 24"
        fill="none"
        stroke="currentColor"
        strokeWidth="2"
        className="h-5 w-5 shrink-0"
      >
        <circle cx="12" cy="12" r="10" />
        <path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3" />
        <path d="M12 17h.01" />
      </svg>
      <span>わからないときはヒントを確認！</span>
    </button>
  );
}
