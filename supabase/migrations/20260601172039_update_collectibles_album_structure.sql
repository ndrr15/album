alter table public.collectibles
drop constraint if exists collectibles_number_key;

alter table public.collectibles
drop column if exists number;

alter table public.collectibles
add column code varchar(20);

alter table public.collectibles
add column tournament_id uuid
references public.tournaments(id);

create unique index idx_collectibles_code
on public.collectibles(code);