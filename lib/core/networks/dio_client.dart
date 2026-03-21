import 'package:dio/dio.dart';
import 'package:nestar_mobile/config/app_config.dart';
import 'package:nestar_mobile/core/utils/log.dart';

import 'dio_helper.dart';

class BaseHttpClient {
  static late final Dio dio;

  static void init() {
    printMe('Base config ::: ${AppConfig.BASE_DEV}');
    final BaseOptions options = BaseOptions(
      baseUrl: AppConfig.BASE_DEV,
      sendTimeout: const Duration(seconds: 120),
      connectTimeout: const Duration(seconds: 120),
      receiveTimeout: const Duration(seconds: 120),
    );

    dio = Dio()
      ..options = options
      ..interceptors.add(DIOHelper.i.defaultInterceptor);
  }
}
