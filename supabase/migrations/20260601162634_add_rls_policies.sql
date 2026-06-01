-- ==========================================
-- ENABLE RLS
-- ==========================================

alter table public.profiles enable row level security;
alter table public.user_collectibles enable row level security;
alter table public.user_achievements enable row level security;

-- ==========================================
-- PROFILES
-- ==========================================

create policy "Users can view own profile"
on public.profiles
for select
using (
    auth.uid() = id
);

create policy "Users can update own profile"
on public.profiles
for update
using (
    auth.uid() = id
);

-- ==========================================
-- USER COLLECTIBLES
-- ==========================================

create policy "Users can view own collectibles"
on public.user_collectibles
for select
using (
    auth.uid() = user_id
);

create policy "Users can insert own collectibles"
on public.user_collectibles
for insert
with check (
    auth.uid() = user_id
);

create policy "Users can update own collectibles"
on public.user_collectibles
for update
using (
    auth.uid() = user_id
);

create policy "Users can delete own collectibles"
on public.user_collectibles
for delete
using (
    auth.uid() = user_id
);

-- ==========================================
-- USER ACHIEVEMENTS
-- ==========================================

create policy "Users can view own achievements"
on public.user_achievements
for select
using (
    auth.uid() = user_id
);

create policy "Users can insert own achievements"
on public.user_achievements
for insert
with check (
    auth.uid() = user_id
);

-- ==========================================
-- PUBLIC TABLES
-- ==========================================

alter table public.teams enable row level security;
alter table public.players enable row level security;
alter table public.collectibles enable row level security;
alter table public.matches enable row level security;
alter table public.achievements enable row level security;

create policy "Public read teams"
on public.teams
for select
using (true);

create policy "Public read players"
on public.players
for select
using (true);

create policy "Public read collectibles"
on public.collectibles
for select
using (true);

create policy "Public read matches"
on public.matches
for select
using (true);

create policy "Public read achievements"
on public.achievements
for select
using (true);