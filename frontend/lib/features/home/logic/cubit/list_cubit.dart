import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/home/data/models/item_model.dart';
import 'package:frontend/features/home/data/services/api_service.dart';
import 'package:frontend/features/payment/data/stripe_api_serviec.dart';

part 'list_state.dart';

class ListCubit extends Cubit<ListState> {
  final ApiService _apiService;
  List<Item> items = [];
  List<Item> selectedItems = [];
  ListCubit(this._apiService) : super(ListInitial());

  Future<void> getAllItems() async {
    try {
      emit(ListLoading());
      final fetchedItems = await _apiService.getAllItems();
      items = fetchedItems;

      emit(ListLoaded(fetchedItems));
    } catch (e) {
      emit(ListError('Failed to load items: $e'));
    }
  }

  void addItem(Item item) {
    selectedItems.add(item);
    // emit(ShoppingUpdated(List.from(selectedItems)));
  }

  void shoppingCartButton() {
    emit(ShowCart());
  }

  void backclicked() {
    emit(ListLoaded(items));
  }

  void removeItemByName(List<Item> items, String nameToRemove) {
    int index = items.indexWhere((item) => item.name == nameToRemove);
    if (index != -1) {
      items.removeAt(index);
    }
    emit(ShowCart());
  }
  
    void checkoutClicked(double amount) {
    emit(ShoppingCheckoutClicked(amount));
    StripeService.instance.makePayment(amount: amount);
    
  }

}
