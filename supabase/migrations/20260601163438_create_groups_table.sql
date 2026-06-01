create table public.groups (
    id uuid primary key default gen_random_uuid(),
    code varchar(5) not null unique,
    name varchar(50) not null,
    created_at timestamptz not null default now()
);