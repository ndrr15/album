create table public.album_collections (
    id uuid primary key default gen_random_uuid(),

    tournament_id uuid not null
    references public.tournaments(id),

    code varchar(50) not null unique,

    name varchar(200) not null,

    total_stickers integer default 0,

    cover_image_url text,

    created_at timestamptz default now()
);

create table public.sticker_types (
    id uuid primary key default gen_random_uuid(),

    code varchar(50) not null unique,

    name varchar(100) not null
);

create table public.stickers (
    id uuid primary key default gen_random_uuid(),

    album_id uuid not null
    references public.album_collections(id),

    sticker_code varchar(20) not null unique,

    sticker_number integer,

    name varchar(200) not null,

    sticker_type_id uuid
    references public.sticker_types(id),

    team_id uuid
    references public.teams(id),

    player_id uuid
    references public.players(id),

    image_url text,

    rarity varchar(20) default 'common',

    created_at timestamptz default now()
);
create index idx_stickers_album
on public.stickers(album_id);

create index idx_stickers_team
on public.stickers(team_id);

create index idx_stickers_player
on public.stickers(player_id);

create index idx_stickers_code
on public.stickers(sticker_code);
