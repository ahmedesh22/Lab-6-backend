import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/home/data/models/item_model.dart';
import 'package:frontend/features/home/logic/cubit/list_cubit.dart';
import 'package:frontend/features/home/logic/cubit/shopping_cubit.dart';
import 'package:frontend/features/home/ui/widgets/shopping_cart_card.dart';

class Shoppingcart extends StatelessWidget {
  final List<Item> Items;
  Shoppingcart({super.key, required this.Items});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {BlocProvider.of<ListCubit>(context).backclicked();}, icon: Icon(Icons.arrow_back)),
        title: Title(
          color: Colors.black,
          child: Text(
            "Shopping cart",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        centerTitle: true,
      ),
      body: BlocBuilder<ListCubit, ListState>(
        builder: (context, state) {
          return Shoppingcartwidget(Items: Items/*BlocProvider.of<ShoppingCubit>(context).selecteditems*/);
        },
      ),
    );
  }
}