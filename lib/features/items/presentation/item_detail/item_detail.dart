import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:items_store/features/items/presentation/item_detail/item_detail_bloc.dart';

import 'item_detail_state.dart';

class ItemDetailPage extends StatelessWidget {
  const ItemDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Detail'),
      ),
      body: BlocBuilder<ItemDetailBloc, ItemDetailState>(
        builder: (context, state) {
          if (state is ItemDetailLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ItemDetailLoaded) {
            return Center(
              child: Text('Item ID: ${state.item.title}'),
            );
          } else {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
        },
      ),
    );
  }
}
