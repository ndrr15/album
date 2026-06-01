create table public.tournaments (
    id uuid primary key default gen_random_uuid(),

    sport_id uuid not null references public.sports(id),

    code varchar(50) not null unique,
    name varchar(200) not null,

    start_date date,
    end_date date,

    host_country varchar(100),

    created_at timestamptz not null default now()
);

insert into public.tournaments (
    sport_id,
    code,
    name,
    host_country
)
select
    id,
    'FIFA_WORLD_CUP_2026',
    'FIFA World Cup 2026',
    'United States, Mexico, Canada'
from public.sports
where code = 'FOOTBALL';

alter table public.groups
add column tournament_id uuid
references public.tournaments(id);

alter table public.teams
add column tournament_id uuid
references public.tournaments(id);

alter table public.players
add column tournament_id uuid
references public.tournaments(id);