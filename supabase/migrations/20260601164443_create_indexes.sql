create index idx_players_team_id
on public.players(team_id);

create index idx_collectibles_team_id
on public.collectibles(team_id);

create index idx_collectibles_player_id
on public.collectibles(player_id);

create index idx_matches_home_team
on public.matches(home_team_id);

create index idx_matches_away_team
on public.matches(away_team_id);

create index idx_user_collectibles_user
on public.user_collectibles(user_id);

create index idx_user_collectibles_collectible
on public.user_collectibles(collectible_id);

create index idx_user_achievements_user
on public.user_achievements(user_id);