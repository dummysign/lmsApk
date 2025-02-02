import 'package:dio/dio.dart';
import 'package:lmsapp/Services/ApiService.dart';

class ApiClient {
  late ApiService _apiService;

  ApiClient() {
    final dio = Dio(
      BaseOptions(
        headers: {
          "Content-Type": "application/json; charset=utf-8",
        },
      ),
    );
    _apiService = ApiService(dio);
  }

  ApiService get apiService => _apiService;
}