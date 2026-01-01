import 'package:get_it/get_it.dart';
import 'package:items_store/core/data/local_storage/bookmarked_items_database.dart';
import 'package:items_store/features/bookmarks/presentation/bloc/bookmarked_bloc.dart';

import '../core/data/local_storage/floor_items_local_repository.dart';
import '../core/domain/bookmarked_items_repository.dart';
import '../features/items/items.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => dioClient());
  locator.registerLazySingleton<RetrofitItemsClient>(
    () => RetrofitItemsClient(locator()),
  );

  final bookmarkedItemsDatabase = await BookmarkedItemsDatabase.init();
  locator.registerLazySingleton(() => bookmarkedItemsDatabase);

  // Repositories
  locator.registerLazySingleton<BookmarkedItemsRepository>(
    () => FloorItemsLocalRepository(bookmarkedItemsDatabase),
  );
  locator.registerLazySingleton<ItemsRepository>(
    () => RetrofitItemsRepository(locator()),
  );

  // Blocs
  locator.registerFactory<ItemDetailBloc>(
    () => ItemDetailBloc(locator(), locator()),
  );
  locator.registerFactory<ItemsBloc>(() => ItemsBloc(locator()));
  locator.registerFactory<BookmarkedBloc>(() => BookmarkedBloc(locator()));
}
