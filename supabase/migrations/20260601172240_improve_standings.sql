alter table public.standings
add column tournament_id uuid
references public.tournaments(id);

create table public.predictions (
    id uuid primary key default gen_random_uuid(),

    user_id uuid not null
        references public.profiles(id)
        on delete cascade,

    match_id uuid not null
        references public.matches(id)
        on delete cascade,

    predicted_home_score integer not null,

    predicted_away_score integer not null,

    points_awarded integer default 0,

    created_at timestamptz default now(),

    unique(user_id, match_id)
);

create table public.trade_offers (
    id uuid primary key default gen_random_uuid(),

    owner_id uuid not null
        references public.profiles(id)
        on delete cascade,

    collectible_id uuid not null
        references public.collectibles(id)
        on delete cascade,

    quantity integer not null default 1,

    active boolean not null default true,

    created_at timestamptz default now()
);