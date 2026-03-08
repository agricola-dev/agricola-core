/// Shared models, API services, and utilities for the Agricola ecosystem.
library agricola_core;

// Config
export 'src/config/environment.dart';

// Constants
export 'src/constants/api_constants.dart';
export 'src/constants/app_constants.dart';
export 'src/constants/storage_constants.dart';
export 'src/constants/validation_rules.dart';

// Domain
export 'src/domain/auth_failure.dart';
export 'src/domain/auth_repository.dart';
export 'src/domain/profile_failure.dart';

// Enums
export 'src/enums/app_language.dart';
export 'src/enums/merchant_type.dart';
export 'src/enums/user_type.dart';

// Helpers
export 'src/helpers/crop_helpers.dart';
export 'src/helpers/loss_calculator_helpers.dart';
export 'src/helpers/profile_validators.dart';

// i18n
export 'src/i18n/translations.dart';

// Models
export 'src/models/analytics_model.dart';
export 'src/models/app_notification.dart';
export 'src/models/crop_catalog_entry.dart';
export 'src/models/crop_model.dart';
export 'src/models/displayable_profile.dart';
export 'src/models/farmer_profile_model.dart';
export 'src/models/harvest_model.dart';
export 'src/models/inventory_model.dart';
export 'src/models/loss_calculation.dart';
export 'src/models/marketplace_filter.dart';
export 'src/models/marketplace_listing.dart';
export 'src/models/merchant_profile_model.dart';
export 'src/models/order_model.dart';
export 'src/models/profile_response.dart';
export 'src/models/purchase_model.dart';
export 'src/models/user_model.dart';

// Network
export 'src/network/auth_interceptor.dart';
export 'src/network/base_api_service.dart';
export 'src/network/retry_interceptor.dart';

// Services
export 'src/services/analytics_api_service.dart';
export 'src/services/crop_api_service.dart';
export 'src/services/crop_catalog_api_service.dart';
export 'src/services/feedback_api_service.dart';
export 'src/services/harvest_api_service.dart';
export 'src/services/inventory_api_service.dart';
export 'src/services/loss_calculator_api_service.dart';
export 'src/services/marketplace_api_service.dart';
export 'src/services/orders_api_service.dart';
export 'src/services/profile_api_service.dart';
export 'src/services/purchases_api_service.dart';

// Utils
export 'src/utils/json_extensions.dart';
export 'src/utils/url_utils.dart';
