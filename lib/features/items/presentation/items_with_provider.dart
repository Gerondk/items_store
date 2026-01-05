import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/service_locator.dart';
import 'bloc/items_bloc.dart';
import 'items_page.dart';

class ItemsWithProvider extends StatelessWidget {
  const ItemsWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          locator<ItemsBloc>()..add(const ItemsEventGetItems()),
      child: const ItemsPage(),
    );
  }
}
