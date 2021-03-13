import 'package:catalog_app2/core/store.dart';
import 'package:catalog_app2/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel{

  // static final cartModel = CartModel._internal();
  //
  // CartModel._internal();
  // factory CartModel() => cartModel;


  //catalog field
  CatalogModel _catalog;

  //collection of ids
  final List<int> _itemIds = [];

  //get catalog
  CatalogModel get catalog => _catalog;


  set catalog(CatalogModel newCatalog)
  {
    _catalog = newCatalog;
  }

  //get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //get total price
  num get totalPrice => items.fold(0, (total, current) => total+current.price);

  //add item
  // void add(Item item){
  //   _itemIds.add(item.id);
  // }

  //remove item
  // void remove(Item item){
  //   _itemIds.remove(item.id);
  // }
}


class AddMutation extends VxMutation<MyStore>{

  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store.cart._itemIds.add(item.id);
  }

}


class RemoveMutation extends VxMutation<MyStore>{

  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store.cart._itemIds.remove(item.id);
  }
}