create table public.profiles (
    id uuid primary key references auth.users(id) on delete cascade,
    display_name text,
    avatar_url text,
    favorite_team_id uuid references public.teams(id),
    level integer not null default 1,
    xp integer not null default 0,
    created_at timestamptz not null default now()
);

create table public.players (
    id uuid primary key default gen_random_uuid(),
    team_id uuid not null references public.teams(id) on delete cascade,
    name varchar(100) not null,
    position varchar(50),
    photo_url text,
    created_at timestamptz not null default now()
);

create table public.collectibles (
    id uuid primary key default gen_random_uuid(),
    number integer not null unique,
    name varchar(150) not null,
    category varchar(50) not null,
    team_id uuid references public.teams(id),
    player_id uuid references public.players(id),
    rarity varchar(20) not null default 'common',
    image_url text,
    description text,
    created_at timestamptz not null default now()
);

create table public.matches (
    id uuid primary key default gen_random_uuid(),
    home_team_id uuid references public.teams(id),
    away_team_id uuid references public.teams(id),
    match_date timestamptz,
    stadium varchar(100),
    status varchar(30),
    home_score integer default 0,
    away_score integer default 0,
    created_at timestamptz not null default now()
);

create table public.achievements (
    id uuid primary key default gen_random_uuid(),
    name varchar(100) not null,
    description text,
    xp_reward integer not null default 0,
    icon text,
    created_at timestamptz not null default now()
);

create table public.user_collectibles (
    id uuid primary key default gen_random_uuid(),
    user_id uuid not null references public.profiles(id) on delete cascade,
    collectible_id uuid not null references public.collectibles(id) on delete cascade,
    status varchar(20) not null default 'missing',
    favorite boolean not null default false,
    updated_at timestamptz not null default now(),
    unique(user_id, collectible_id)
);

create table public.user_achievements (
    id uuid primary key default gen_random_uuid(),
    user_id uuid not null references public.profiles(id) on delete cascade,
    achievement_id uuid not null references public.achievements(id) on delete cascade,
    unlocked_at timestamptz not null default now(),
    unique(user_id, achievement_id)
);