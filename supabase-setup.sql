-- Run this once in Supabase SQL Editor.
-- This table is used by the GitHub Pages tracker.
create table if not exists public.study_topics (
  id uuid primary key default gen_random_uuid(),
  project text not null,
  item_code text default '',
  description text not null,
  type text not null default 'Task',
  priority text not null default 'Medium',
  pending_dept text default '',
  followup text default '',
  status text not null default 'Open',
  start_date date,
  end_date date,
  target_date date,
  remarks text default '',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.study_topics enable row level security;

-- Public tracker: anyone who can access the GitHub Pages site can read/write.
-- If you later need login-based/private access, replace these policies with
-- authenticated-user policies.
drop policy if exists "study_topics_public_select" on public.study_topics;
create policy "study_topics_public_select"
on public.study_topics for select
to anon, authenticated
using (true);

drop policy if exists "study_topics_public_insert" on public.study_topics;
create policy "study_topics_public_insert"
on public.study_topics for insert
to anon, authenticated
with check (true);

drop policy if exists "study_topics_public_update" on public.study_topics;
create policy "study_topics_public_update"
on public.study_topics for update
to anon, authenticated
using (true)
with check (true);

drop policy if exists "study_topics_public_delete" on public.study_topics;
create policy "study_topics_public_delete"
on public.study_topics for delete
to anon, authenticated
using (true);

grant select, insert, update, delete on public.study_topics to anon, authenticated;

create or replace function public.set_study_topics_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists study_topics_updated_at on public.study_topics;
create trigger study_topics_updated_at
before update on public.study_topics
for each row execute function public.set_study_topics_updated_at();

-- Optional starter row:
-- insert into public.study_topics (project, description, type, priority, status)
-- values ('Sample Project', 'Sample task', 'Task', 'Medium', 'Open');
