alter table public.tournaments
add column logo_url text;

alter table public.tournaments
add column banner_url text;

alter table public.tournaments
add column description text;

alter table public.tournaments
add column is_active boolean default true;

alter table public.matches
add column tournament_id uuid
references public.tournaments(id);

alter table public.matches
add column stage varchar(50);

alter table public.matches
add column venue varchar(200);

alter table public.matches
add column city varchar(100);

alter table public.matches
add column attendance integer;

alter table public.collectibles
add column is_special boolean default false;

alter table public.collectibles
add column is_limited boolean default false;

alter table public.collectibles
add column xp_reward integer default 0;

alter table public.user_collectibles
add column quantity integer default 0;

create table public.album_progress (
    id uuid primary key default gen_random_uuid(),

    user_id uuid not null
        references public.profiles(id)
        on delete cascade,

    tournament_id uuid not null
        references public.tournaments(id),

    total_collectibles integer default 0,

    owned_collectibles integer default 0,

    completion_percentage numeric(5,2) default 0,

    updated_at timestamptz default now(),

    unique(user_id, tournament_id)
);

create table public.collectible_types (
    id uuid primary key default gen_random_uuid(),

    code varchar(50) unique not null,

    name varchar(100) not null
);

alter table public.collectibles
add column collectible_type_id uuid
references public.collectible_types(id);