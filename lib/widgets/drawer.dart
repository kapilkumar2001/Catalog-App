import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:catalog_app2/models/catalog.dart';
import 'package:catalog_app2/utils/routes.dart';



class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageurl = "https://avatars.githubusercontent.com/u/56160115?s=400&u=4a626eb49996e3d35774ca1d23de92017b537ca6&v=4";
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("Kapil Kumar"),
                accountEmail: Text("201951079@iiitv.ac.in"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageurl),
                ),
              ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.black,
            ),
            title: Text(
              "Home",
              textScaleFactor: 1.1,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.grid,
              color: Colors.black,
            ),
            title: Text(
              "GridView",
              textScaleFactor: 1.1,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.mail,
              color: Colors.black,
            ),
            title: Text(
              "Email me",
              textScaleFactor: 1.1,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}




class GridPage extends StatefulWidget {
  @override
  _GridPageState createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {


  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async
  {
    await Future.delayed(Duration(seconds: 2));
    final catalogjson = await rootBundle.loadString("assets/files/catalog.json");
    final decodecData = jsonDecode(catalogjson);
    var productData = decodecData["products"];
    CatalogModel.items = List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: (CatalogModel.items!=null &&  CatalogModel.items.isNotEmpty) ?
          // ListView.builder(
          //   itemCount: CatalogModel.items.length,
          //   itemBuilder: (context,index){
          //     return ItemWidget(
          //       item: CatalogModel.items[index],
          //     );
          //   },
          // )
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
            itemBuilder: (context,index){
              final item = CatalogModel.items[index];
              return Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                child: GridTile(
                  header: Container(
                    child: Text(
                      item.name,
                      style: TextStyle(color: Colors.white),
                    ),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                    ),
                  ),
                  child: Image.network(
                    item.image,
                  ),
                  footer: Container(
                    child: Text(
                      item.price.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                  ),
                ),
              );
            },
            itemCount: CatalogModel.items.length,
          )
              :Center(
            child: CircularProgressIndicator(),
          )
      ),
      drawer: MyDrawer(),
    );
  }
}







