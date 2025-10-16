import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// A centralized and secure service for handling sensitive data
/// such as tokens, credentials, or user preferences.
///
/// This class uses [flutter_secure_storage] which stores data in:
/// - iOS Keychain
/// - Android EncryptedSharedPreferences / Keystore
///
/// It is designed as a singleton, ensuring consistent access
/// throughout the entire application.
///
/// Usage example:
/// ```dart
/// await AppSecureStorage().save(SecureStorageKeys.accessToken.name, token);
/// final token = await AppSecureStorage().read(SecureStorageKeys.accessToken.name);
/// ```
class AppSecureStorage {
  // -----------------------
  // Singleton pattern
  // -----------------------
  static final AppSecureStorage _instance = AppSecureStorage._internal();
  factory AppSecureStorage() => _instance;
  AppSecureStorage._internal();

  // The underlying secure storage instance
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  // -----------------------
  // Save data securely
  // -----------------------
  /// Saves a [value] using the given [key].
  ///
  /// Returns `true` on success, `false` if operation failed.
  Future<bool> save(String key, String value) async {
    if (key.isEmpty) {
      // Defensive check to avoid invalid writes
      return false;
    }

    try {
      await _secureStorage.write(key: key, value: value);
      return true;
    } catch (e) {
      // Catch platform-specific exceptions
      return false;
    }
  }

  // -----------------------
  // Read data securely
  // -----------------------
  /// Reads a value for the given [key].
  ///
  /// Returns the stored value, or `null` if not found or an error occurs.
  Future<String?> read(String key) async {
    if (key.isEmpty) {
      return null;
    }

    try {
      final value = await _secureStorage.read(key: key);
      if (value == null) {
      } else {}
      return value;
    } catch (e) {
      return null;
    }
  }

  // -----------------------
  // Delete a specific key
  // -----------------------
  /// Deletes a specific [key] from secure storage.
  ///
  /// Returns `true` on success, `false` if deletion failed.
  Future<bool> delete(String key) async {
    if (key.isEmpty) {
      return false;
    }

    try {
      await _secureStorage.delete(key: key);
      return true;
    } catch (e) {
      return false;
    }
  }

  // -----------------------
  // Clear all stored data
  // -----------------------
  /// Clears all data stored in secure storage.
  ///
  /// Use carefully — this removes *all* saved keys.
  Future<bool> clear() async {
    try {
      await _secureStorage.deleteAll();
      return true;
    } catch (e) {
      return false;
    }
  }

  // -----------------------
  // List all keys (debug only)
  // -----------------------
  /// Returns all stored keys.
  ///
  /// ⚠️ Use only for debugging or non-sensitive inspection.
  Future<List<String>> getAllKeys() async {
    try {
      final all = await _secureStorage.readAll();
      return all.keys.toList();
    } catch (e) {
      return [];
    }
  }
}

/// Enum representing commonly used secure storage keys.
///
/// Keeps key naming consistent and avoids typo errors.
enum SecureStorageKeys {
  accessToken,
  refreshToken,
  userId,
  userEmail,
}
