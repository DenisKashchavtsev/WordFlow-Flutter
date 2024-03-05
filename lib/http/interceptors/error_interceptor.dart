import 'package:dio/dio.dart';

import '../../services/snack_bar_global_service.dart';

class ErrorInterceptor extends Interceptor {

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 && err.response?.data['message'] != null) {
      SnackBarGlobalService.show(err.response?.data['message']);
    }

    super.onError(err, handler);
  }
}
