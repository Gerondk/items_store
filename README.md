# items_store

A Flutter app that displays a list of store items (products) and allows a user to bookmark items after logging in.

## Features

- Login screen (simple form validation)
- Products list fetched from EscuelaJS API
- Product details screen
- Bookmark items locally (saved in a local database)
- Bookmarks screen (view and delete saved items)

## API

This app uses the EscuelaJS fake store API:

- Base URL: https://api.escuelajs.co/api/v1/
- Products endpoint: `/products`
- Product details endpoint: `/products/{id}`

## Tech Stack
- clean architecture
- Flutter (Material 3)
- Navigation: `go_router`
- State management: `flutter_bloc`
- DI: `get_it`
- Networking: `dio` + `retrofit`
- Local persistence: `floor` (SQLite)

## Project Structure (high level)

- [lib/main.dart](cci:7://file:///Users/kwenda/FlutterRepos/items_store/lib/main.dart:0:0-0:0): app entrypoint
- `lib/routes/`: navigation setup (`GoRouter`)
- [lib/di/service_locator.dart](cci:7://file:///Users/kwenda/FlutterRepos/items_store/lib/di/service_locator.dart:0:0-0:0): GetIt registrations (Dio, Retrofit client, Floor DB, repositories, blocs)
- `lib/features/`:
    - `authentication/`: login UI
    - `items/`: products list + product details (remote via Retrofit)
    - `bookmarks/`: bookmarked items UI/BLoC
- `lib/core/data/local_storage/`: Floor database + entities/DAO for bookmarks
## Screenchots on IOS

<img src="screenshots/login.png" width="250" />
<img src="screenshots/items_list.png" width="250" />
<img src="screenshots/item_detail.png" width="250" />
<img src="screenshots/bookmarked_items.png" width="250" />

## Getting Started

### Prerequisites

- Flutter SDK installed
- A connected device/emulator

### Install dependencies

```bash
flutter pub get
```
### Code generation (Retrofit / Floor / JSON)

This project contains generated files (e.g. *.g.dart). If you change DTOs, Retrofit clients, or Floor entities/DAO, regenerate with:
dart run build_runner build --delete-conflicting-outputs

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Run

```bash
flutter run
```
