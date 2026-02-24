"use client";

import {
  getReadingHint,
  getReadingHintLabel,
  type ReadingHintType,
} from "@/lib/reading-hints";
import { BuddyHintPanel } from "@/components/features/buddy/BuddyHintPanel";

interface ReadingHintPanelProps {
  type: ReadingHintType;
  level: string;
  isOpen: boolean;
  onClose: () => void;
}

export function ReadingHintPanel({
  type,
  level,
  isOpen,
  onClose,
}: ReadingHintPanelProps) {
  const hint = getReadingHint(type, level);
  const label = getReadingHintLabel(type);

  return (
    <BuddyHintPanel
      title={`ヒント（英検${level} ${label}）`}
      hintContent={hint}
      isOpen={isOpen}
      onClose={onClose}
      accent="reading"
    />
  );
}

interface ReadingHintButtonProps {
  onClick: () => void;
  isOpen?: boolean;
}

export function ReadingHintButton({ onClick, isOpen }: ReadingHintButtonProps) {
  return (
    <button
      type="button"
      onClick={onClick}
      className={`fixed bottom-6 right-6 z-30 flex items-center gap-2 rounded-full px-4 py-2.5 text-sm font-medium shadow-lg transition-all hover:shadow-xl ${
        isOpen
          ? "bg-[#009DC9] text-white hover:bg-[#0087A8]"
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
