part of 'shopping_cubit.dart';


sealed class ShoppingState {}

final class ShoppingInitial extends ShoppingState {}


final class ShoppingCart extends ShoppingState {
  final List<Item> selectedItems;
  ShoppingCart([this.selectedItems = const []]);
}

final class ShoppingUpdated extends ShoppingState {
  final List<Item> selectedItems;
  ShoppingUpdated(this.selectedItems);
}

// final class ShoppingLoading extends ShoppingState {}

// final class ShoppingLoaded extends ShoppingState {
//   final List<Item> items;
//   ShoppingLoaded(this.items);
// }

// final class ShoppingError extends ShoppingState {
//   final String message;
//   ShoppingError(this.message);
// }
