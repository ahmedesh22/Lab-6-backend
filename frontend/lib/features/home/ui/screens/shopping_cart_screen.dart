import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:frontend/features/home/data/models/item_model.dart';
import 'package:frontend/features/home/logic/cubit/list_cubit.dart';
import 'package:frontend/features/home/logic/cubit/shopping_cubit.dart';
import 'package:frontend/features/home/ui/widgets/shopping_cart_card.dart';

class Shoppingcart extends StatefulWidget {
  final List<Item> Items;
  Shoppingcart({super.key, required this.Items});

  @override
  State<Shoppingcart> createState() => _ShoppingcartState();
}


class _ShoppingcartState extends State<Shoppingcart> {

    @override
  void initState() {
    super.initState();
    Stripe.publishableKey = "pk_test_51R2nJ2RwVjLWCdgYtHO6d3plGszY28kdq3OJl2drlq2cOSeQv57LAonVyR3KhOnkHAyjBWGRgWwdb536IV28RM9u00IV0p9q4z";
  }

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
          return Column(
            children: [
              Expanded(child: Shoppingcartwidget(Items: widget.Items/*BlocProvider.of<ShoppingCubit>(context).selecteditems*/)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    double price=0;
                  for(int i =0; i<widget.Items.length; i++){
                      price += widget.Items[i].price;
                  }
                
                  BlocProvider.of<ListCubit>(context).checkoutClicked(price);
                  },
                  child: Text("Checkout"),
                ),
              )

            ],
          );
        },
      ),
    );
  }
}