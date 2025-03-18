// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:frontend/features/Home/data/models/item_model.dart';
// import 'package:frontend/features/home/logic/cubit/shopping_cubit.dart';

// class ShoppingCart extends StatelessWidget {
//   final List<Item> items;
//   const ShoppingCart({super.key, required this.items});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: items.length,
//       itemBuilder: (context, index) {
//         final item = items[index];
//         return ListTile(
//           leading: CircleAvatar(
//             backgroundImage: NetworkImage(item.imageUrl),
//           ),
//           title: Text(
//             item.name,
//             style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
//           ),
//           subtitle: Text(
//             item.description,
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//             style: const TextStyle(color: Colors.grey),
//           ),
//           trailing: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 "\$${item.price}",
//                 style: const TextStyle(fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(width: 10),
//               IconButton(
//                 icon: const Icon(Icons.remove_circle, color: Colors.red),
//                 onPressed: () {
//                   BlocProvider.of<ShoppingCubit>(context).removeItemByName(item.name);
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
