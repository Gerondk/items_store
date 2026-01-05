import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/service_locator.dart';
import 'bloc/bookmarked_bloc.dart';
import 'bookmarked_items_page.dart';

class BookmarkedWithProvider extends StatelessWidget {
  const BookmarkedWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<BookmarkedBloc>(),
      child: const BookmarkedItemsPage(),
    );
  }
}
