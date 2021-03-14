import 'package:catalog_app2/core/store.dart';
import 'package:catalog_app2/models/cart.dart';
import 'package:catalog_app2/models/catalog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart( {
    Key key, this.catalog,
  }) : super(key: key);

  //bool isInCart = false;
  // final _cart = CartModel();

  @override
  Widget build(BuildContext context) {

    VxState.watch(context, on: [AddMutation, RemoveMutation]);

    final CartModel _cart = (VxState.store as MyStore).cart;
  //  final CatalogModel _catalog = (VxState.store as MyStore).catalog;

    bool isInCart = _cart.items.contains(catalog)?? false;

    return ElevatedButton(
      onPressed: (){
        if(!isInCart) {
         // isInCart = isInCart.toggle();
         // final _catalog = CatalogModel();

         // _cart.catalog = _catalog;

          AddMutation(catalog);
          // _cart.add(catalog);
          // setState(() {});
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          context.theme.buttonColor,
        ),
        shape: MaterialStateProperty.all(
          StadiumBorder(),
        ),
      ),
      child: isInCart? Icon(Icons.done): "Add to Cart".text.make(),
    );
  }
}
