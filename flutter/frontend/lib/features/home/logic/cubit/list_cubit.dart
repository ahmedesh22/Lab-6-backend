import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/Home/data/models/item_model.dart';
import 'package:meta/meta.dart';

part 'list_state.dart';

class ShoppingCubit extends Cubit<ShoppingState> {
  List<Item> items = mockShoppingItems;
  late List<Item> selecteditems;
  
  ShoppingCubit() : super(ShoppingInitial());

void removeItemByName(List<Item> items, String nameToRemove) {
  items.removeWhere((item) => item.name == nameToRemove);
  emit(CartState());
}
void backclicked(){emit(ShoppingInitial());}
void shoppingcartbutton(){emit(CartState());}
}