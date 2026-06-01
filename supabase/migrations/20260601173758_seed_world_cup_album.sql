insert into public.album_collections (
    tournament_id,
    code,
    name,
    total_stickers
)
select
    id,
    'FIFA2026',
    'FIFA World Cup 2026 Official Album',
    1048
from public.tournaments
where code = 'FIFA_WORLD_CUP_2026';