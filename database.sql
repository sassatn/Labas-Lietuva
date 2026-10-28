-- Run in Supabase SQL Editor. Authenticated users can access only their own progress.
create table if not exists public.learning_progress (
 user_id uuid primary key references auth.users(id) on delete cascade,
 progress jsonb not null default '{}'::jsonb,
 updated_at timestamptz not null default now()
);
alter table public.learning_progress enable row level security;
create policy "Users read own progress" on public.learning_progress for select to authenticated using ((select auth.uid()) = user_id);
create policy "Users insert own progress" on public.learning_progress for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "Users update own progress" on public.learning_progress for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
