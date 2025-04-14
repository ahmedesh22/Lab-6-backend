import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/home/logic/cubit/list_cubit.dart';
import 'package:frontend/features/home/ui/screens/list_screen.dart';
import 'package:frontend/features/home/ui/screens/shopping_cart_screen.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ListCubit,ListState>(builder: (context,state){
//       return ListScreen();
//     } );
//   }
// }

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListCubit, ListState>(builder: (context, state) {
      if (state is ShowCart) {
        return Shoppingcart(
            Items: BlocProvider.of<ListCubit>(context).selectedItems);
      } else if (state is ListInitial) {
        BlocProvider.of<ListCubit>(context).getAllItems();
        return CircularProgressIndicator();
      } else if (state is ListLoaded) {
        return ListScreen(fetchedItems: state.items);
      } else if (state is ListError) {
        return Scaffold(body: Center(child: Text(state.message)));
      } else {
        return Container();
      }
      ;
    });
  }
}
