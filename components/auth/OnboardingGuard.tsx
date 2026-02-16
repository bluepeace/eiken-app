"use client";

import { useEffect, useState } from "react";
import { useRouter, usePathname } from "next/navigation";
import { supabase } from "@/lib/supabase/client";

export function OnboardingGuard({ children }: { children: React.ReactNode }) {
  const router = useRouter();
  const pathname = usePathname();
  const [checked, setChecked] = useState(false);

  useEffect(() => {
    const check = async () => {
      const {
        data: { user }
      } = await supabase.auth.getUser();
      if (!user) {
        setChecked(true);
        return;
      }

      const { data: profile } = await supabase
        .from("user_profiles")
        .select("display_name, target_level")
        .eq("auth_user_id", user.id)
        .maybeSingle();

      if (!profile?.display_name || !profile?.target_level) {
        router.replace("/onboarding");
        return;
      }

      setChecked(true);
    };
    void check();
  }, [router, pathname]);

  if (!checked) {
    return (
      <div className="flex min-h-[50vh] items-center justify-center">
        <p className="text-slate-600">読み込み中...</p>
      </div>
    );
  }

  return <>{children}</>;
}
