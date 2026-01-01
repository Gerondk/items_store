import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:items_store/features/bookmarks/presentation/bloc/bookmarked_bloc.dart';
import 'package:items_store/features/bookmarks/presentation/bloc/bookmarked_event.dart';
import 'package:items_store/features/bookmarks/presentation/bloc/bookmarked_state.dart';

class BookmarkedItemsPage extends StatelessWidget {
  const BookmarkedItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarked Items'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocBuilder<BookmarkedBloc, BookmarkedState>(
        builder: (context, state) {
          if (state is BookmarkedEmpty) {
            return const Center(child: Text('NO ITEMS SAVED YET'));
          } else if (state is BookmarkedLoaded) {
            final items = state.items;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    tileColor: Theme.of(context).colorScheme.surfaceContainer,
                    title: Text(item.name, maxLines: 1, overflow: .ellipsis),
                    subtitle: Text(
                      item.description,
                      maxLines: 1,
                      overflow: .ellipsis,
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        context.read<BookmarkedBloc>().add(
                          BookmarkedEventDelete(item.id),
                        );
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('UNKNOWN'));
          }
        },
      ),
    );
  }
}
