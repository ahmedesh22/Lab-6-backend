import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/home/data/models/item_model.dart';

part 'shopping_state.dart';

class ShoppingCubit extends Cubit<ShoppingState> {
  List<Item> selecteditems = [];

  ShoppingCubit() : super(ShoppingInitial());



  void removeItemByName(String name) {
    selecteditems.removeWhere((item) => item.name == name);
    emit(ShoppingUpdated(List.from(selecteditems)));
  }

}



