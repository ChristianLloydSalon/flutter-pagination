import 'package:dio/dio.dart';
import 'package:exam/config/environment.dart';

final httpClient = Dio(
  BaseOptions(
    baseUrl: AppConfig.apiUrl,
  ),
);
