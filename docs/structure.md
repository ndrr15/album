# Documentación: Estructura del proyecto

Este documento ofrece una vista organizada de las carpetas y responsabilidades actualmente en el repositorio.

- `backend/`: código del servidor (pendiente de definir lenguaje/estructura).
- `database/`: SQL y seeds.
  - `migrations/`: migraciones SQL (ej. `001_initial_schema.sql`).
  - `seeds/`: datos de ejemplo para poblar la BD.
- `docs/`: documentación del proyecto (modelos, roadmap, prd).
- `mobile/`: app móvil (estructura aún por definir).
- `supabase/`: configuración y migraciones de Supabase.

Recomendaciones inmediatas:
- Documentar el stack del `backend` (Node/Express, Python/Django, etc.).
- Añadir `backend/README.md` con comandos de arranque.
- Mantener las migraciones en una única fuente de verdad si es posible.
