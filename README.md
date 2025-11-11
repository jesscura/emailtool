SageStone Email ToolWelcome to the SageStone Email Tool, a modern, production-ready email marketing platform.This repository contains the full monorepo for the SageStone Email Tool, including:flutter_app/: A cross-platform frontend built with Flutter. It provides a native experience for web, desktop (macOS, Windows, Linux), and mobile (iOS, Android).backend/: The complete backend API (NestJS), background workers (BullMQ), and shared packages, ported from the original ssemail project.prisma/: The unified database schema (PostgreSQL) for the entire application.🚀 Quick Start (Local Development)This guide assumes you have Node.js (v18+), pnpm, Flutter (v3.19+), and Docker installed.1. Start Backend ServicesThe backend relies on PostgreSQL and Redis. You can start them easily using Docker.# From the root directory
docker-compose up -d
2. Set Up the BackendThe backend (API and workers) is a Node.js project.# Navigate to the backend
cd backend

# Install all Node.js dependencies
pnpm install

# Copy environment files
cp apps/api/.env.example apps/api/.env
cp apps/workers/.env.example apps/workers/.env

# --- IMPORTANT ---
# Edit the .env files to add your database URL and other secrets.
# The default DATABASE_URL should be:
# DATABASE_URL="postgresql://postgres:postgres@localhost:5432/ssemail?schema=public"

# Run database migrations
pnpm exec prisma migrate dev --name init

# Build all backend packages
pnpm build

# Start the backend (API and workers)
pnpm dev
Your NestJS API is now running at http://localhost:3000.3. Run the Flutter AppIn a new terminal window:# Navigate to the Flutter app
cd flutter_app

# Install Flutter dependencies
flutter pub get

# Run the app on your desired platform
flutter run -d chrome  # For Web
flutter run -d macos   # For macOS
flutter run            # For a connected mobile device/simulator
📁 Project StructureSageStoneEmailTool/
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
