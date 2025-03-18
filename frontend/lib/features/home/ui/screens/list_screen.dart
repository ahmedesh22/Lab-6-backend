import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/Home/logic/cubit/shopping_cubit.dart';
import 'package:frontend/features/home/data/models/item_model.dart';
import 'package:frontend/features/home/logic/cubit/list_cubit.dart';
import 'package:frontend/features/home/ui/screens/shopping_cart_screen.dart'; // Import your shopping cart screen

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

/* {
            "_id": "67d821f7d9cde37478547902",
            "name": "Margherita Pizza",
            "description":
                "Classic pizza topped with fresh tomatoes, mozzarella cheese, and basil.",
            "price": 8.99,
            "imageUrl": "https://placehold.co/300x300?text=Margherita+Pizza"
          },
          {
            "_id": "67d821f7d9cde37478547903",
            "name": "Cheeseburger",
            "description":
                "Juicy grilled beef patty with cheddar cheese, lettuce, and tomato.",
            "price": 7.49,
            "imageUrl": "https://placehold.co/300x300?text=Cheeseburger"
          },
          {
            "_id": "67d821f7d9cde37478547904",
            "name": "Caesar Salad",
            "description":
                "Crisp romaine lettuce with Caesar dressing, croutons, and Parmesan cheese.",
            "price": 5.99,
            "imageUrl": "https://placehold.co/300x300?text=Caesar+Salad"
          },
          {
            "_id": "67d821f7d9cde37478547905",
            "name": "Spaghetti Bolognese",
            "description":
                "Spaghetti pasta served with a rich and savory beef Bolognese sauce.",
            "price": 10.5,
            "imageUrl": "https://placehold.co/300x300?text=Spaghetti+Bolognese"
          },
          {
            "_id": "67d821f7d9cde37478547906",
            "name": "Grilled Chicken Sandwich",
            "description":
                "Grilled chicken breast served on a toasted bun with lettuce and mayo.",
            "price": 6.75,
            "imageUrl":
                "https://placehold.co/300x300?text=Grilled+Chicken+Sandwich"
          },
          {
            "_id": "67d821f7d9cde37478547907",
            "name": "French Fries",
            "description": "Crispy golden fries served with ketchup.",
            "price": 3.49,
            "imageUrl": "https://placehold.co/300x300?text=French+Fries"
          },
          {
            "_id": "67d821f7d9cde37478547908",
            "name": "Chocolate Milkshake",
            "description":
                "Creamy chocolate milkshake topped with whipped cream.",
            "price": 4.99,
            "imageUrl": "https://placehold.co/300x300?text=Chocolate+Milkshake"
          }, */

  @override
  Widget build(BuildContext context) {
    List fetchedItems = context.read<ListCubit>().items ??
        [
          Item(
              name: "Chocolate Milkshake",
              price: 4.99,
              description:
                  "Creamy chocolate milkshake topped with whipped cream.",
              imageUrl: "https://placehold.co/300x300?text=Chocolate+Milkshake")
        ];
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
