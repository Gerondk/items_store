import 'model.dart';

abstract class ItemsRepository {
  Future<List<ItemModel>> getItems();

  Future<ItemModel> getItemById(int id);
}