import 'package:app_flutter_starter_for_job/src/core/constants/api_path/api_path.dart';
import 'package:app_flutter_starter_for_job/src/module/home/domain/model/category_model.dart';
import 'package:app_flutter_starter_for_job/src/module/home/domain/model/get_product_model.dart';
import 'package:app_flutter_starter_for_job/src/module/home/domain/model/product_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@lazySingleton
@RestApi()
abstract class AppApi {
  @factoryMethod
  factory AppApi(Dio dio) = _AppApi;

  @GET(ApiPath.getPhotos)
  Future<List<GetProductModel>> getProduct();

  @GET(ApiPath.getCategory)
  Future<List<CategoryModel>> getCategory();  

  @GET(ApiPath.getProducts)
  Future<List<GetProductionModel>> getAllProduct();
}
