create table public.sports (
    id uuid primary key default gen_random_uuid(),
    code varchar(20) not null unique,
    name varchar(100) not null,
    created_at timestamptz not null default now()
);