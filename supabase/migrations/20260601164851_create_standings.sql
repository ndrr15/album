create table public.standings (
    id uuid primary key default gen_random_uuid(),

    team_id uuid not null references public.teams(id),

    played integer default 0,
    wins integer default 0,
    draws integer default 0,
    losses integer default 0,

    goals_for integer default 0,
    goals_against integer default 0,

    goal_difference integer default 0,

    points integer default 0,

    updated_at timestamptz default now()
);