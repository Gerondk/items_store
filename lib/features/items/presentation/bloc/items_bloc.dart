import 'package:bloc/bloc.dart';
import 'package:items_store/features/items/domain/items_repository.dart';

import '../../domain/model.dart';

part 'items_event.dart';
part 'items_state.dart';

class ItemsBloc extends Bloc<ItemsEvent, ItemsState> {
  final ItemsRepository _itemsRepository;

  ItemsBloc(this._itemsRepository) : super(ItemsInitial()) {
    on<ItemsEventGetItems>(_getItems);
  }

  void _getItems(ItemsEvent event, Emitter<ItemsState> emit) async {
    emit(ItemsLoading());
    try {
      final items = await _itemsRepository.getItems();
      emit(ItemsLoaded(items: items));
    } catch (e) {
      emit(ItemsError(message: e.toString()));
    }
  }
}
