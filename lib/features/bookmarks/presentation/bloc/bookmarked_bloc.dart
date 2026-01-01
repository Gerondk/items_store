import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/bookmarked_item.dart';
import '../../../../core/domain/bookmarked_items_repository.dart';
import 'bookmarked_event.dart';
import 'bookmarked_state.dart';

class BookmarkedBloc extends Bloc<BookmarkedEvent, BookmarkedState> {
  StreamSubscription<List<BookmarkedItem>>? _bookmarkedItemsSubscription;

  final BookmarkedItemsRepository _bookmarkedItemsRepository;

  BookmarkedBloc(this._bookmarkedItemsRepository) : super(BookmarkedInitial()) {
    log('BookmarkedBloc constructor');
    _bookmarkedItemsSubscription = _bookmarkedItemsRepository.getItems().listen(
      (items) {
        log('BookmarkedBloc listen ');
        add(BookmarkedEventLoad(items));
      },
    );

    on<BookmarkedEventLoad>(_onBookmarkedEventLoad);
    on<BookmarkedEventDelete>(_onBookmarkedEventDelete);
  }

  FutureOr<void> _onBookmarkedEventLoad(
    BookmarkedEventLoad event,
    Emitter<BookmarkedState> emit,
  ) async {
    if (event.items.isEmpty) {
      emit(BookmarkedEmpty());
      return;
    }
    emit(BookmarkedLoaded(event.items));
  }

  Future<void> _onBookmarkedEventDelete(
    BookmarkedEventDelete event,
    Emitter<BookmarkedState> emit,
  ) async {
    await _bookmarkedItemsRepository.deleteItemById(event.bookmarkedItemId);
    log('BookmarkedBloc item ${event.bookmarkedItemId} deleted');
  }

  @override
  Future<void> close() {
    _bookmarkedItemsSubscription?.cancel();
    return super.close();
  }
}
