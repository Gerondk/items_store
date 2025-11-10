import '../domain/model.dart';
import 'dto_product_entity.dart';

extension DtoProductEntityToItemModel on DtoProductEntity {
  ItemModel toItemModel() {
    return ItemModel(
      id: id,
      title: title,
      description: description,
      price: price.toDouble(),
      creationAt: creationAt,
      updatedAt: updatedAt,
      category: category,
      images: images,
    );
  }
}
