# Estructura del proyecto (estado actual)

Este archivo resume la estructura actual del proyecto y los archivos clave detectados en el repositorio.

Raíz:
- package.json
- README.md
- PROJECT_STRUCTURE.md
- .gitignore
- .env.example

Carpetas principales:
- backend/
- database/
  - migrations/
  - seeds/
- docs/
  - database-model.md
  - prd.md
  - roadmap.md
  - structure.md (generado)
  - status.md (generado)
- mobile/
- supabase/
  - config.toml
  - migrations/
    - 20260601154054_initial_schema.sql

Notas rápidas:
- Las migraciones iniciales están en `database/migrations/001_initial_schema.sql` y en `supabase/migrations/20260601154054_initial_schema.sql`.
- Agregué `docs/structure.md` y `docs/status.md` para detalles y estado.
- Incluyo `.env.example` y `.gitignore` para facilitar la configuración local.

Si quieres, puedo generar diagramas ER o un archivo `CONTRIBUTING.md` a continuación.
