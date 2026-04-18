# Changelog

## 1.1.3 — 2026-04-18

### Changed
- `AuthRepository.signInWithGoogle` now accepts an optional `createIfNew` flag (default `true`). When `false`, the method will not create a Firestore document for a new user and returns a `userNotFound` failure instead, allowing the caller to redirect to registration.

## 1.1.2 — 2026-04-18

### Fixed
- `imageUrlForCrop` now returns `''` (empty string) instead of a hardcoded Unsplash fallback URL when no image is available for a crop. Prevents stale Unsplash URLs from causing 404 crashes.

## 1.1.1 — 2026-04-17

### Added
- Translation keys for marketplace order flow: `request_sent`, `seller_will_contact_you`, `view_orders`
- Translation keys for loss calculator custom inputs: `specify_unit`, `specify_storage_method`

## 1.1.0 — 2026-03-26

### Added
- 9 new bilingual i18n keys for form validation: `field_required`, `email_invalid`, `password_too_short`, `number_invalid`, `number_positive`, `name_too_short`, `name_too_long`, `village_too_short`, `village_too_long`

## 1.0.1 — 2026-03-25

### Added
- `InventoryApiService.bulkDeleteInventory(List<String> ids)` — POST `/api/v1/inventory/bulk-delete`
- `InventoryApiService.bulkUpdateCondition(List<String> ids, String condition)` — PATCH `/api/v1/inventory/bulk-condition`
- 8 new bilingual translation keys for bulk inventory actions: `items_selected`, `bulk_delete`, `bulk_update_condition`, `bulk_delete_confirm`, `bulk_update_condition_confirm`, `bulk_delete_success`, `bulk_update_success`, `select_condition`
