alter table public.players
add column sticker_code varchar(20);

alter table public.players
add column image_url text;

alter table public.players
add column shirt_number integer;

alter table public.players
add column birth_date date;

alter table public.players
add column captain boolean default false;