import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/home/data/models/item_model.dart';
import 'package:frontend/features/home/logic/cubit/list_cubit.dart';

class Shoppingcartwidget extends StatelessWidget {
  final List<Item> Items;
  const Shoppingcartwidget({super.key, required this.Items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Items.length,
      itemBuilder: (context, index) {
        final item = Items[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blueAccent,
            backgroundImage: NetworkImage(item.imageUrl),
            onBackgroundImageError: (error, stackTrace) {
              debugPrint("Image load error: $error");
            },
            child: Icon(Icons.broken_image,
                size: 30, color: Colors.white), // Default icon
          ),
          title: Text(
            item.name,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          subtitle: Text(
            item.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.grey),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "\$${item.price}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 10),
              IconButton(
                icon: Icon(Icons.remove_circle),
                color: Colors.red,
                onPressed: () {
                  BlocProvider.of<ListCubit>(context).removeItemByName(
                      BlocProvider.of<ListCubit>(context).selectedItems,
                      item.name);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
