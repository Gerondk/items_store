import 'package:dio/dio.dart';
import 'package:items_store/features/items/data/dto_product_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'retrofit_items_client.g.dart';

@RestApi(baseUrl: "https://api.escuelajs.co/api/v1/")
abstract class RetrofitItemsClient {
  factory RetrofitItemsClient(Dio dio) => _RetrofitItemsClient(dio);

  @GET("/products")
  Future<List<DtoProductEntity>> getItems();

  @GET("/products/{id}")
  Future<DtoProductEntity> getItemById(@Path("id") int id);
}
