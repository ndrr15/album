create extension if not exists "pgcrypto";

create table public.teams (
    id uuid primary key default gen_random_uuid(),
    code varchar(10) not null unique,
    name varchar(100) not null,
    group_name varchar(5),
    flag_url text,
    coach varchar(100),
    ranking integer,
    created_at timestamptz not null default now()
);