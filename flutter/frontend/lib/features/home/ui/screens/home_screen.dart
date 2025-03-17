import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/Home/data/models/item_model.dart';
import 'package:frontend/features/home/logic/cubit/list_cubit.dart';
import 'package:frontend/features/home/ui/screens/list_screen.dart';
import 'package:frontend/features/home/ui/screens/shopping_cart_screen.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingCubit,ShoppingState>(builder: (context,state){if(state is CartState)
    {
      return Shoppingcart(Items: mockShoppingItems);
    }
    return ListScreen();
    } );
  }
}