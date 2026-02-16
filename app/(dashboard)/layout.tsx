import { AppShell } from "@/components/layout/AppShell";
import { OnboardingGuard } from "@/components/auth/OnboardingGuard";

export default function DashboardLayout({
  children
}: {
  children: React.ReactNode;
}) {
  return (
    <AppShell>
      <OnboardingGuard>{children}</OnboardingGuard>
    </AppShell>
  );
}
