import 'package:items_store/features/items/data/mappers.dart';
import 'package:items_store/features/items/data/retrofit_items_client.dart';

import '../domain/items_repository.dart';
import '../domain/model.dart';

class RetrofitItemsRepository implements ItemsRepository {
  final RetrofitItemsClient _retrofitItemsClient;

  RetrofitItemsRepository(this._retrofitItemsClient);

  @override
  Future<List<ItemModel>> getItems() => _retrofitItemsClient.getItems().then(
        (value) => value.map((e) => e.toItemModel()).toList(),
      );

  @override
  Future<ItemModel> getItemById(int id) =>
      _retrofitItemsClient.getItemById(id).then((value) => value.toItemModel());
}
