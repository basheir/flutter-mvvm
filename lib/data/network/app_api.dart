import 'package:dio/dio.dart';
import 'package:mvvm_project/app/constant.dart';
import 'package:mvvm_project/data/responses/BaseResponse.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST('/customer/login')
  Future<AuthenticationResponse> login();
}
