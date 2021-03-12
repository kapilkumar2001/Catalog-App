import 'package:flutter/cupertino.dart';

class CatalogModel{

  static final catModel = CatalogModel._internal();

  CatalogModel._internal();
  factory CatalogModel() => catModel;

   static List<Item> items// = [
  //   Item(
  //     id: 1,
  //     name : "iphone 12 pro",
  //     desc : "Apple iphone 12th generation",
  //     price: 999,
  //     color: "#33505a",
  //     image : "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-12-black-select-2020?wid=940&hei=1112&fmt=png-alpha&qlt=80&.v=1604343702000",
  //   )]
   ;


  Item getById(int id) =>
    items.firstWhere((element) => element.id == id , orElse: null);

  Item getByPosition(int pos) => items[pos];
}

class Item{
  final int id;
  final String name;
  final String desc;
  final int price;
  final String color;
  final String image;

  Item({this.id, this.name, this.desc, this.price, this.color, this.image});

  factory Item.fromMap(Map<String,dynamic> map){
    return Item(
      id : map["id"],
      name : map["name"],
      desc : map["desc"],
      price : map["price"],
      color : map["color"],
      image : map["image"],
    );
  }

  toMap() => {
    "id" : id,
    "name" : name,
    "desc" : desc,
    "price" : price,
    "color" : color,
    "image" : image,
  };

}

