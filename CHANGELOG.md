# Changelog

## 1.0.1 — 2026-03-25

### Added
- `InventoryApiService.bulkDeleteInventory(List<String> ids)` — POST `/api/v1/inventory/bulk-delete`
- `InventoryApiService.bulkUpdateCondition(List<String> ids, String condition)` — PATCH `/api/v1/inventory/bulk-condition`
- 8 new bilingual translation keys for bulk inventory actions: `items_selected`, `bulk_delete`, `bulk_update_condition`, `bulk_delete_confirm`, `bulk_update_condition_confirm`, `bulk_delete_success`, `bulk_update_success`, `select_condition`
