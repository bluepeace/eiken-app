"use client";

import { LoginForm } from "@/components/LoginForm";

export default function LoginSlugPage({
  params
}: {
  params: { slug: string };
}) {
  const { slug } = params;
  return <LoginForm slug={slug} />;
}
