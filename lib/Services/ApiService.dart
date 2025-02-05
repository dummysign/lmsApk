import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../Model/BookListResponse.dart';
import '../Model/CountryResponse.dart';
import '../Model/LoginResponse.dart';
import '../Model/RegisterResponse.dart';
import '../Model/StateResponse.dart';
import '../Model/countrymodel.dart';
part 'ApiService.g.dart';

@RestApi(baseUrl: "http://192.168.238.209/LMSAPI2/api/Student/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;


  @GET("countries")
  Future<CountryResponse> getcountries();

  @GET("states")
  Future<StateResponse> getstate( @Query('countryId') int countryId);

  @POST('signup')
  Future<RegisterResponse> signup(@Body() Map<String, dynamic> body);


  @POST('Login')
  Future<LoginResponse> Login(@Body() Map<String, dynamic> body);

  @GET('BookList')
  Future<BookListResponse> BookList();

}