docker-compose up -d
## SageStone Email Tool

Welcome to the SageStone Email Tool, a modern, production-ready email marketing platform.

This monorepo contains:
- `backend/` – NestJS API (`apps/api`), BullMQ workers (`apps/workers`), and shared packages (`packages/email`, `packages/billing`).
- `flutter_app/` – Cross‑platform Flutter frontend (web, desktop, mobile).
- `prisma/` – Unified PostgreSQL database schema and migrations.

---
## 🚀 Quick Start (Local Development)
Requirements: Node.js v18+, pnpm, Flutter v3.19+, Docker (for Postgres + Redis).

### 1. Start Infrastructure (Postgres + Redis)
```bash
docker compose up -d
```

### 2. Install Dependencies
At the repository root (uses pnpm workspaces):
```bash
pnpm install
```

### 3. Environment Configuration
Create environment files as needed (examples recommended – create them if missing):
```bash
cp backend/apps/api/.env.example backend/apps/api/.env || true
cp backend/apps/workers/.env.example backend/apps/workers/.env || true
```
Edit the `.env` files and set:
```
DATABASE_URL="postgresql://postgres:postgres@localhost:5432/ssemail?schema=public"
```

### 4. Database Migrations & Prisma Client
```bash
pnpm --filter prisma run migrate:dev
pnpm --filter prisma run generate
```

### 5. Build Backend (Monorepo)
You can build via the aggregation package or per app:
```bash
# Build both apps via Nest CLI (aggregation)
pnpm --filter backend run build

# OR build individually
pnpm --filter api run build
pnpm --filter workers run build
```

### 6. Run Backend in Dev Mode
```bash
pnpm --filter backend run dev
```
API will be available at: http://localhost:3000

### 7. Run Flutter App
```bash
cd flutter_app
flutter pub get
flutter run -d chrome      # Web
flutter run -d macos       # macOS
flutter run                # Mobile (device/simulator)
```

---
## 📁 Project Structure
```
SageStoneEmailTool/
├── backend/
│   ├── apps/
│   │   ├── api/          # NestJS backend API (Port 3000)
│   │   └── workers/      # BullMQ background workers
│   ├── packages/
│   │   ├── email/        # Email sending utilities
│   │   ├── billing/      # Billing logic
│   │   └── ...           # Other shared packages
│   ├── package.json
│   └── pnpm-workspace.yaml
│
├── flutter_app/          # NEW Flutter application
│   ├── assets/
│   │   └── sagestoneinc-logo.jpg
│   ├── lib/
│   │   ├── src/
│   │   │   ├── app.dart
│   │   │   ├── core/
│   │   │   ├── features/   # All app screens (website & tool)
│   │   │   ├── routing/
│   │   │   └── theme/
│   │   └── main.dart
│   └── pubspec.yaml
│
├── prisma/               # Database schema and migrations
├── .gitignore
├── docker-compose.yml    # Local dev services (Postgres, Redis)
├── package.json          # Root package.json (for pnpm)
└── README.md             # This file
```

---
## 🧪 Smoke Test
A simple way to verify the API builds and starts:
```bash
pnpm --filter backend run build && pnpm --filter backend run dev:api
```
You should see: `API server listening on port 3000`.

---
## ✅ Notes & Improvements
- Added `tsconfig.json` at repo root for shared compiler config.
- Added `pnpm-workspace.yaml` at root for proper workspace scoping.
- Introduced `nest-cli.json` to define `api` and `workers` projects.
- Created minimal `AppModule` and `WorkersModule`.
- Added app-level `package.json` files for `api` and `workers` to resolve dependencies locally.

Future enhancements:
- Add authentication & authorization layer.
- Implement proper email provider integration in `packages/email`.
- Add billing integration (Stripe) in `packages/billing`.
- Introduce Jest tests and CI workflow.

---
## 📄 License
Proprietary – internal SageStone tooling (adjust this section as needed).
