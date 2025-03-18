import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/Home/logic/cubit/shopping_cubit.dart';
import 'package:frontend/features/home/data/models/item_model.dart';
import 'package:frontend/features/home/logic/cubit/list_cubit.dart';
import 'package:frontend/features/home/ui/screens/shopping_cart_screen.dart'; // Import your shopping cart screen

class ListScreen extends StatelessWidget {
  List<Item> fetchedItems;
  ListScreen({required this.fetchedItems});

  @override
  Widget build(BuildContext context) {
  

    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping List"),
        actions: [
          IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                BlocProvider.of<ListCubit>(context).shoppingCartButton();
              })
        ],
      ),
      body: ListView.builder(
        itemCount: fetchedItems.length,
        itemBuilder: (context, index) {
          final item = fetchedItems[index];
          return ListTile(
            // leading: Image.network(
            //   item.imageUrl,
            //   width: 50,
            //   height: 50,
            //   fit: BoxFit.cover,
            // ),
            title: Text(item.name),
            subtitle: Text("\$${item.price.toStringAsFixed(2)}"),
            trailing: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                context.read<ListCubit>().addItem(item);
              },
            ),
          );
        },
      ),
    );
  }
}
