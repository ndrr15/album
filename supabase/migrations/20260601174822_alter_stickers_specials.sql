alter table public.stickers
add column is_special boolean default false;

alter table public.stickers
add column section_code varchar(20);

alter table public.stickers
add column display_order integer;