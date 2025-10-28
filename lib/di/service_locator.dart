import 'package:get_it/get_it.dart';

import '../features/items/items.dart';

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
