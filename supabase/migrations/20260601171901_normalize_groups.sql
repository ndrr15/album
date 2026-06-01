alter table public.teams
add column group_id uuid references public.groups(id);

update public.teams t
set group_id = g.id
from public.groups g
where t.group_name = g.code;

select
    t.name,
    t.group_name,
    g.name
from public.teams t
join public.groups g
on t.group_id = g.id;

alter table public.teams
drop column group_name;