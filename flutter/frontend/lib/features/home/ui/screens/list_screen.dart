import 'package:flutter/material.dart';
import 'package:frontend/features/home/data/models/item_model.dart';
class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping List"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: ListView.builder(
        itemCount: mockShoppingItems.length,
        itemBuilder: (context, index) {
          final item = mockShoppingItems[index];
          return GestureDetector(
            child: Column(
              children: [
                ListTile(
                  leading: Image.network(item.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
                  title: Text(item.name),
                  subtitle: Text("\$${item.price.toStringAsFixed(2)}"),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}