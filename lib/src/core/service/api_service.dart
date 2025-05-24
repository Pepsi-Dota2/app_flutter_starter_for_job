import 'package:app_flutter_starter_for_job/src/core/constants/api_path/api_path.dart';
import 'package:app_flutter_starter_for_job/src/core/model/auth_model.dart';
import 'package:app_flutter_starter_for_job/src/core/model/pos_stock_model.dart';
import 'package:app_flutter_starter_for_job/src/module/cart/model/check_bill_model.dart';
import 'package:app_flutter_starter_for_job/src/module/history/model/history_model.dart';
import 'package:app_flutter_starter_for_job/src/module/home/model/pos_stock_item_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@lazySingleton
@RestApi()
abstract class AppApi {
  @factoryMethod
  factory AppApi(Dio dio) = _AppApi;

  @POST(ApiPath.authLogin)
  Future<AuthModel> login(@Body() Map<String, dynamic> body);

  @POST(ApiPath.posStock)
  Future<PosStockModel> posStock(@Body() Map<String, dynamic> body);

  @GET(ApiPath.getHistory)
  Future<HistoryModel> getHistory();

}
