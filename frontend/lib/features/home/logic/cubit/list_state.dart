part of 'list_cubit.dart';


sealed class ListState {}

final class ListInitial extends ListState {}

final class ListLoading extends ListState {}

final class ListLoaded extends ListState {
  final List<Item> items;
  ListLoaded(this.items);
}

final class ListError extends ListState {
  final String message;
  ListError(this.message);
}
final class ShowCart extends ListState{}