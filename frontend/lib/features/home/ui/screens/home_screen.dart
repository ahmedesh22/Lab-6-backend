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
    return BlocBuilder<ListCubit,ListState>(builder: (context,state){
      if(state is ShowCart)
      {
        return Shoppingcart(Items: BlocProvider.of<ListCubit>(context).selectedItems);
      }
      return ListScreen();
    } );
  }
}
