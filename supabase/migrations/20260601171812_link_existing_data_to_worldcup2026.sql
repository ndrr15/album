-- Asignar torneo a grupos

update public.groups
set tournament_id = (
    select id
    from public.tournaments
    where code = 'FIFA_WORLD_CUP_2026'
);

-- Asignar torneo a equipos

update public.teams
set tournament_id = (
    select id
    from public.tournaments
    where code = 'FIFA_WORLD_CUP_2026'
);