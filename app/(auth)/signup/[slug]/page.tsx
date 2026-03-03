"use client";

import { use } from "react";
import { SignupForm } from "@/components/SignupForm";

export default function SignupSlugPage({
  params
}: {
  params: Promise<{ slug: string }>;
}) {
  const { slug } = use(params);
  return <SignupForm slug={slug} />;
}
