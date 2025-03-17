import 'package:flutter_bloc/flutter_bloc.dart';

part 'list_state.dart';

class ListCubit extends Cubit<ListState> {
  ListCubit() : super(ListInitial());
}
