import 'package:get_it/get_it.dart';
import 'package:items_store/features/items/data/retrofit_items_client.dart';

import '../features/items/data/dio_client.dart';
import '../features/items/data/retrofit_Items_repository.dart';
import '../features/items/domain/items_repository.dart';
import '../features/items/presentation/bloc/items_bloc.dart';
import '../features/items/presentation/item_detail/item_detail_bloc.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => dioClient());
  locator.registerLazySingleton<RetrofitItemsClient>(
    () => RetrofitItemsClient(locator()),
  );

  // Repositories
  locator.registerLazySingleton<ItemsRepository>(
    () => RetrofitItemsRepository(locator()),
  );

  // Blocs
  locator.registerFactory<ItemDetailBloc>(
    () => ItemDetailBloc(locator()),
  );
  locator.registerFactory<ItemsBloc>(
    () => ItemsBloc(locator()),
  );
}
