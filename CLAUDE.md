# Agricola Core — project context for Claude

## What it is
Shared Dart package used by both the mobile app (agricola) and the web dashboard (agricola-dashboard). Contains models, API services, enums, constants, helpers, network infrastructure, and i18n. **No platform-specific dependencies** — no Firebase, drift, or dart:io.

- SDK: Dart ^3.9.0, Flutter >=3.9.0
- Key deps: `flutter_riverpod`, `dio`, `equatable`, `fpdart`, `uuid`, `intl`

---

## Directory layout

```
lib/
  agricola_core.dart             — barrel file (all public exports)
  src/
    config/
      environment.dart           — dev/prod switching + API base URL
    constants/
      api_constants.dart         — endpoint paths + timeout config
      app_constants.dart         — app-wide defaults
      storage_constants.dart     — local storage keys
      validation_rules.dart      — profile/input validation rules
    domain/
      auth_failure.dart          — AuthFailure enum + class
      auth_repository.dart       — abstract auth repository interface
      profile_failure.dart       — profile failure types
    enums/
      app_language.dart          — AppLanguage { english, setswana }
      user_type.dart             — UserType { farmer, merchant }
      merchant_type.dart         — MerchantType { agriShop, ... + 7 others }
    helpers/
      crop_helpers.dart          — crop stage, progress %, date formatting
      loss_calculator_helpers.dart
      profile_validators.dart
    i18n/
      translations.dart          — bilingual translation map + t(key, language)
    models/                      — 16 domain models (User, Crop, Inventory, Order, etc.)
    network/
      auth_interceptor.dart      — Dio interceptor; abstract AuthTokenProvider
      retry_interceptor.dart     — auto-retry for cold starts (60s timeout, 3 retries)
      base_api_service.dart      — base class with CRUD helpers + error handling
    services/                    — 11 API service classes
    utils/
      json_extensions.dart       — type-safe JSON parsing (JsonParsing extension)
      url_utils.dart
```

---

## Key patterns

### Barrel file
`agricola_core.dart` re-exports everything by category. Consumers import:
```dart
import 'package:agricola_core/agricola_core.dart';
```

### Models
- Extend `Equatable` for value equality
- Include `copyWith()` for immutability
- `fromJson()` / `toJson()` for serialization
- Use `JsonParsing` extension for type-safe parsing

### API services
- Use Dio, optionally extend `BaseApiService`
- CRUD: `create()`, `getAll()`, `update()`, `delete()`
- Endpoints defined in `ApiConstants`
- Error handling via `BaseApiService` (friendly user messages)

### Network
- **AuthInterceptor**: abstract `AuthTokenProvider` interface — each app implements with its own auth (Firebase for mobile, Google Sign-In for web)
- **RetryInterceptor**: handles Render cold starts (60s timeout, 3 retries, 3-5s delays)
- **BaseApiService**: generic error handling + user-friendly messages

### i18n
- `translations.dart`: `Map<String, Map<AppLanguage, String>>` with all strings
- `t(key, language)` returns localised string
- Bilingual: English + Setswana

---

## Key split conventions

These types exist in core as platform-agnostic versions. Each consumer app extends them:

| Core (pure) | Mobile extension | Dashboard extension |
|-------------|-----------------|-------------------|
| `UserModel` | `user_model_firebase.dart` (Firebase factories) | — |
| `AuthFailure` | `authFailureFromFirebaseException` | — |
| `AuthInterceptor` (abstract `AuthTokenProvider`) | Firebase token provider | Web token provider |

---

## How it's consumed

Both apps depend on it via path in their `pubspec.yaml`:
```yaml
agricola_core:
  path: ../agricola-core
```

Any change here affects both mobile and dashboard — test both after modifying shared code.
