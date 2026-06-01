create table public.trades (
    id uuid primary key default gen_random_uuid(),

    creator_user_id uuid not null
    references public.profiles(id),

    status varchar(20) not null default 'open',

    created_at timestamptz default now()
);

create table public.trade_items (
    id uuid primary key default gen_random_uuid(),

    trade_id uuid not null
    references public.trades(id)
    on delete cascade,

    user_id uuid not null
    references public.profiles(id),

    collectible_id uuid not null
    references public.collectibles(id),

    created_at timestamptz default now()
);

create table public.user_wishlist (
    id uuid primary key default gen_random_uuid(),

    user_id uuid not null
    references public.profiles(id)
    on delete cascade,

    collectible_id uuid not null
    references public.collectibles(id)
    on delete cascade,

    created_at timestamptz default now(),

    unique(user_id, collectible_id)
);
