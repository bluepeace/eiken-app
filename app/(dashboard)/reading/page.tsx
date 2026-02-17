"use client";

import { useState, useEffect } from "react";
import Link from "next/link";
import {
  getProfileTargetLevel,
  profileLevelToVocabularyLevel,
} from "@/lib/data/vocabulary-db";
import {
  READING_LEVELS,
  getMenuItemsForLevel,
  type ReadingLevel,
} from "@/lib/constants/reading";
import { MODULE_COLORS } from "@/lib/constants/module-colors";

function isValidReadingLevel(s: string): s is ReadingLevel {
  return READING_LEVELS.includes(s as ReadingLevel);
}

export default function ReadingPage() {
  const [selectedLevel, setSelectedLevel] = useState<ReadingLevel>("2級");
  const [levelLoaded, setLevelLoaded] = useState(false);

  useEffect(() => {
    getProfileTargetLevel().then((targetLevel) => {
      setLevelLoaded(true);
      if (!targetLevel) return;
      const profileLevel = profileLevelToVocabularyLevel(targetLevel);
      if (isValidReadingLevel(profileLevel)) {
        setSelectedLevel(profileLevel);
      }
    });
  }, []);

  const menuItems = getMenuItemsForLevel(selectedLevel);

  return (
    <main className="min-h-[calc(100vh-64px)] px-4 py-8">
      <div className="mx-auto max-w-xl">
        <div className="space-y-6 rounded-2xl border border-slate-200 bg-white p-6 shadow-sm">
          <div className="flex items-center justify-between">
            <h1 className="flex items-center gap-2 text-xl font-semibold text-slate-900">
              <span
                className={`h-2 w-2 rounded-full ${MODULE_COLORS.reading.dot}`}
              />
              リーディング
            </h1>
            <Link
              href="/reading/history"
              className="text-sm text-slate-600 hover:text-slate-900"
            >
              履歴
            </Link>
          </div>
          <p className="text-sm text-slate-600">
            級を選ぶと、その級で出題される形式のメニューが表示されます。形式を選んで学習を開始しましょう。
          </p>

          <div className="space-y-2">
            <label className="block text-xs font-medium text-slate-700">
              級
            </label>
            <select
              value={selectedLevel}
              onChange={(e) =>
                setSelectedLevel(e.target.value as ReadingLevel)
              }
              className="w-full rounded-lg border border-slate-300 bg-white px-3 py-2 text-sm text-slate-900"
            >
              {READING_LEVELS.map((l) => (
                <option key={l} value={l}>
                  英検{l}
                </option>
              ))}
            </select>
          </div>

          <div className="space-y-3">
            <p className="text-xs font-medium text-slate-500">
              この級の出題形式
            </p>
            {menuItems.length === 0 ? (
              <p className="rounded-xl border border-slate-200 bg-slate-50 p-5 text-sm text-slate-600">
                この級に対応した問題はまだ登録されていません。
              </p>
            ) : (
              <ul className="space-y-3">
                {menuItems.map((item) => (
                  <li key={item.type}>
                    <Link
                      href={`${item.path}?level=${encodeURIComponent(selectedLevel)}`}
                      className={`flex flex-col gap-1.5 rounded-xl border border-slate-200 p-5 transition-colors ${MODULE_COLORS.reading.hoverBg}`}
                    >
                      <span className="text-sm font-medium text-slate-900">
                        {item.label}
                      </span>
                      <span className="text-xs text-slate-600">
                        {item.description}
                      </span>
                    </Link>
                  </li>
                ))}
              </ul>
            )}
          </div>

          <div className="flex justify-center pt-2">
            <Link
              href="/dashboard"
              className="text-sm text-slate-500 hover:text-slate-700"
            >
              ダッシュボードに戻る
            </Link>
          </div>
        </div>
      </div>
    </main>
  );
}
