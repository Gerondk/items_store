import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:items_store/features/items/presentation/items_page.dart';
import 'package:items_store/routes/routes_path.dart';

import '../di/service_locator.dart';
import '../features/items/presentation/bloc/items_bloc.dart';
import '../features/items/presentation/item_detail/item_detail.dart';
import '../features/items/presentation/item_detail/item_detail_bloc.dart';
import '../features/items/presentation/item_detail/item_detail_event.dart';

final GoRouter router = GoRouter(
  initialLocation: RoutePath.items.path,
  routes: <RouteBase>[
    GoRoute(
      path: RoutePath.items.path,
      builder: (context, state) => BlocProvider(
        create: (context) => locator<ItemsBloc>()
          ..add(
            const ItemsEventGetItems(),
          ),
        child: const ItemsPage(),
      ),
      routes: <RouteBase>[
        GoRoute(
          path: '${RoutePath.itemDetail.path}/:itemId',
          builder: (context, state) {
            final itemId = state.pathParameters['itemId']!;
            return BlocProvider(
              create: (context) => locator<ItemDetailBloc>()
                ..add(
                  ItemDetailEventGetItem(itemId: int.parse(itemId)),
                ),
              child: const ItemDetailPage(),
            );
          },
        ),
      ],
    ),
  ],
);
