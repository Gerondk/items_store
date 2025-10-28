import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:items_store/routes/routes_path.dart';

import '../di/service_locator.dart';
import '../features/items/items.dart';

final GoRouter router = GoRouter(
  initialLocation: RoutePath.items.path,
  redirect: _redirectHandler,
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

// Monitor the navigation
String? _redirectHandler(BuildContext context, GoRouterState state) {
  final itemId = state.pathParameters['itemId'];
  final path = state.fullPath;

  log('Redirect: itemId $itemId');
  log('Redirect: current fullPath $path');
  return null;
}
