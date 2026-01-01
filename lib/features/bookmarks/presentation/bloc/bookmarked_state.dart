import 'package:equatable/equatable.dart';

import '../../../../core/domain/bookmarked_item.dart';

sealed class BookmarkedState extends Equatable {
  const BookmarkedState();
}

class BookmarkedInitial extends BookmarkedState {
  @override
  List<Object?> get props => [];
}

class BookmarkedLoaded extends BookmarkedState {
  final List<BookmarkedItem> items;
  const BookmarkedLoaded(this.items);

  @override
  List<Object?> get props => [items];
}

class BookmarkedEmpty extends BookmarkedState {
  @override
  List<Object?> get props => [];
}
