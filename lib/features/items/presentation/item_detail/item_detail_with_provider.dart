import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../di/service_locator.dart';
import 'item_detail.dart';
import 'item_detail_bloc.dart';
import 'item_detail_event.dart';

class ItemsDetailWithProvider extends StatelessWidget {
  final String itemId;
  const ItemsDetailWithProvider({super.key, required this.itemId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          locator<ItemDetailBloc>()
            ..add(ItemDetailEventGetItem(itemId: int.parse(itemId))),
      child: const ItemDetailPage(),
    );
  }
}
