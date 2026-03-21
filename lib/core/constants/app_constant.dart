// ignore_for_file: non_constant_identifier_names

class AppConstant {
  // Create singleton instance
  AppConstant._();
  static String? USER_TOKEN;
  static String? USER_EMAIL;
  static String? USER_NAME;
  static String? USER_ID;
  static String? USER_AVATAR;
  static String? USER_REFRESH_TOKEN;

  static void clearData() {
    USER_ID = null;
    USER_EMAIL = '';
    USER_TOKEN = null;
    USER_REFRESH_TOKEN = null;
    USER_AVATAR = '';
  }
}
