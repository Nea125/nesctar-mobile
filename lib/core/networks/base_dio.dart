import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nestar_mobile/core/constants/app_constant.dart';
import 'package:nestar_mobile/core/networks/dio_client.dart';
import 'package:nestar_mobile/core/utils/log.dart';
import 'dio_exception.dart';
import 'dio_helper.dart';
final baseApiServiceProvider = Provider<BaseApiService>((ref) {
  return BaseApiService(ref);
});

class BaseApiService {
  final Ref ref;
  late Dio dio;

  BaseApiService(this.ref, {Dio? dio}) {
    if (dio != null) {
      this.dio = dio;
    } else {
      this.dio = BaseHttpClient.dio;
    }
  }

  Future<T> onRequest<T>({
    required String path,
    required String method,
    required T Function(Response response) onSuccess,
    Map<String, dynamic>? query,
    Map<String, dynamic> headers = const {},
    dynamic data = const {},
    String? customToken,
    Dio? customDioClient,
    bool isNeedToken = true,
  }) async {
    late Response response;

    try {
      final httpOption = Options(method: method, headers: {});
      //Get token from storage
      if (isNeedToken) {
       
        // final response = await ref
        //     .read(authRepoProvider)
        //     .refreshAppToken(AppConstant.USER_REFRESH_TOKEN ?? '');
        // if (response.data != null)
        //   AppConstant.USER_TOKEN = response.data!.token ?? '';
      }
      
      if (path == '/change-password') {
        print(
            'AppConstant.USER_TOKEN?.isNotEmpty is ${AppConstant.USER_TOKEN}');
        print('isNeedToken is ${isNeedToken}');
      }
      printMe("AppConstant.USER_TOKEN is ${AppConstant.USER_TOKEN}");
      if (AppConstant.USER_TOKEN == null) {
        // AppConstant.USER_TOKEN = await AppStorage.i.getAppToken();
      }
      if ((AppConstant.USER_TOKEN?.isNotEmpty ?? false) && isNeedToken) {
        httpOption.headers!['Authorization'] =
            "Bearer ${AppConstant.USER_TOKEN}";
      } else if (customToken != null) {
        httpOption.headers!['Authorization'] = "Bearer $customToken";
      }

      httpOption.headers!.addAll(headers);
      printMe("httpOption.headers: ${httpOption.headers}");
      query ??= {};

      if (customDioClient != null) {
        response = await customDioClient.request(
          path,
          options: httpOption,
          queryParameters: query,
          data: data,
        );
      } else {
        response = await dio.request(
          path,
          options: httpOption,
          queryParameters: query,
          data: data,
        );
      }

      if (response.data != null) {
        debugPrint("Response Status Code: ${response.statusCode}");
        return onSuccess(response);
      } else {
        throw ServerResponseHttpException(response.data['message']);
      }
    } on DioException catch (exception, stackTrace) {
    

      throw DIOHelper.i.onDioError(exception);
    } on ServerResponseHttpException catch (exception, stackTrace) {
  

      throw DIOHelper.i.onServerResponseException(exception, response);
    } catch (exception, stackTrace) {
     
      print('exception is ${exception.toString()}');
      throw DIOHelper.i.onTypeError(exception, stackTrace);
    }
  }
}
