"use client";

import { SignupForm } from "@/components/SignupForm";

export default function SignupSlugPage({
  params
}: {
  params: { slug: string };
}) {
  const { slug } = params;
  return <SignupForm slug={slug} />;
}
