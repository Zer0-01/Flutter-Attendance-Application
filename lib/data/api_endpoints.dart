import 'package:flutter_attendance_application/configuration/app_environment.dart';

/// A centralized store for all API endpoint paths used in the app.
///
/// This helps maintain consistency and prevents hardcoding strings
/// throughout the codebase.
///
/// Example:
/// ```dart
/// final url = "${ProfileConstants.api}${ApiEndpoints.login}";
/// ```
class ApiEndpoints {
  // ---------------------------------------------------------------------------
  // 🧩 Authentication
  // ---------------------------------------------------------------------------
  static const String login = "/auth/login";
  static const String logout = "/auth/logout";
  static const String refresh = "/auth/refresh";
  static const String register = "/auth/register";

  // ---------------------------------------------------------------------------
  // 👤 User
  // ---------------------------------------------------------------------------
  static const String userProfile = "/user/me";
  static const String updateProfile = "/user/update";
  static const String changePassword = "/user/change-password";

  // ---------------------------------------------------------------------------
  // 🛒 Product & Category
  // ---------------------------------------------------------------------------
  static const String categories = "/catalog/categories";
  static const String products = "/catalog/products";
  static const String productDetails = "/catalog/product/detail";

  // ---------------------------------------------------------------------------
  // 🚚 Order & Checkout
  // ---------------------------------------------------------------------------
  static const String orders = "/orders";
  static const String orderDetails = "/orders/detail";
  static const String checkout = "/orders/checkout";

  // ---------------------------------------------------------------------------
  // 💳 Payment
  // ---------------------------------------------------------------------------
  static const String paymentMethods = "/payments/methods";
  static const String paymentStatus = "/payments/status";

  // ---------------------------------------------------------------------------
  // 🏗️ Miscellaneous / Utility
  // ---------------------------------------------------------------------------
  static const String appVersion = "/app/version";
  static const String contactSupport = "/support/contact";

  // ---------------------------------------------------------------------------
  // ⚙️ Environment Helper
  // ---------------------------------------------------------------------------
  /// Returns the **fully qualified URL** for a given endpoint.
  ///
  /// Example:
  /// ```dart
  /// final url = ApiEndpoints.url(ApiEndpoints.login);
  /// ```
  static String url(String endpoint) {
    try {
      // Defensive check: ensure endpoint starts with `/`
      final normalized = endpoint.startsWith("/") ? endpoint : "/$endpoint";

      // Append environment base URL (e.g., staging or production)
      final base = ProfileConstants.api;

      return "$base$normalized";
    } catch (e) {
      // Fail-safe fallback for malformed endpoint access
      return "";
    }
  }

  // ---------------------------------------------------------------------------
  // 🧠 Diagnostic / Debug
  // ---------------------------------------------------------------------------
  /// Returns all known endpoints for inspection or debugging.
  ///
  /// Useful in automated tests or endpoint monitoring scripts.
  static Map<String, String> get all {
    return {
      "login": login,
      "logout": logout,
      "refresh": refresh,
      "register": register,
      "userProfile": userProfile,
      "updateProfile": updateProfile,
      "changePassword": changePassword,
      "categories": categories,
      "products": products,
      "productDetails": productDetails,
      "orders": orders,
      "orderDetails": orderDetails,
      "checkout": checkout,
      "paymentMethods": paymentMethods,
      "paymentStatus": paymentStatus,
      "appVersion": appVersion,
      "contactSupport": contactSupport,
    };
  }
}
