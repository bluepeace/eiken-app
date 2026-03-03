"use client";

import { use } from "react";
import { LoginForm } from "@/components/LoginForm";

export default function LoginSlugPage({
  params
}: {
  params: Promise<{ slug: string }>;
}) {
  const { slug } = use(params);
  return <LoginForm slug={slug} />;
}
