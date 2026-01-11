import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:items_store/features/bookmarks/presentation/bookmarked_with_provider.dart';
import 'package:items_store/features/items/presentation/items_with_provider.dart';
import 'package:items_store/routes/layout_scaffold.dart';
import 'package:items_store/routes/routes_path.dart';

import '../features/authentication/presentation/login_page.dart';
import '../features/items/presentation/item_detail/item_detail_with_provider.dart';

final GoRouter router = GoRouter(
  initialLocation: RoutePath.login.path,
  redirect: _redirectHandler,
  routes: <RouteBase>[
    GoRoute(
      path: RoutePath.login.path,
      builder: (context, state) => const LoginPage(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          LayoutScaffold(navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutePath.items.path,
              builder: (context, state) => const ItemsWithProvider(),
              routes: <RouteBase>[
                GoRoute(
                  path: '${RoutePath.itemDetail.path}/:itemId',
                  builder: (context, state) {
                    final itemId = state.pathParameters['itemId']!;
                    return ItemsDetailWithProvider(itemId: itemId);
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutePath.bookmarkedItems.path,
              builder: (context, state) => const BookmarkedWithProvider(),
            ),
          ],
        ),
      ],
    ),
  ],
);

// Monitor the navigation
String? _redirectHandler(BuildContext context, GoRouterState state) {
  final itemId = state.pathParameters['itemId'];
  final path = state.fullPath;

  log('Redirect: itemId $itemId');
  log('Redirect: current fullPath $path');
  return null;
}
