import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:catalog_app2/models/catalog.dart';
import 'package:catalog_app2/utils/routes.dart';
import 'package:catalog_app2/widgets/drawer.dart';
import 'package:catalog_app2/widgets/item_widget.dart';
import 'package:catalog_app2/widgets/themes.dart';
import 'package:catalog_app2/models/catalog.dart';
import 'package:catalog_app2/models/catalog.dart';
import 'package:catalog_app2/models/catalog.dart';
import 'package:catalog_app2/models/catalog.dart';
import 'package:catalog_app2/models/catalog.dart';
import 'package:catalog_app2/widgets/themes.dart';
import 'package:catalog_app2/widgets/themes.dart';
import 'package:catalog_app2/widgets/themes.dart';
import 'package:catalog_app2/widgets/themes.dart';
import 'package:catalog_app2/widgets/themes.dart';
import 'dart:convert';
import 'pages/loginpage.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.loginRoute,
      routes: {
        "/" : (context) => loginpage(),
        MyRoutes.listRoute : (context) => ListPage(),
        MyRoutes.loginRoute : (context) => loginpage(),
        MyRoutes.gridRoute : (context) => GridPage(),
      },
    );
  }
}

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {


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
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if(CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
                CatalogList().expand()
              else
                Center(
                    child : CircularProgressIndicator(),
                ),
            ],
          ),
        ),
      )
    );
  }
}


class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl4.bold.color(MyTheme.darkBluishColor).make(),
        //"Trending products".text.xl2.make(),
      ],
    );
  }
}




class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
        itemBuilder: (context, index){
          final catalog = CatalogModel.items[index];
          return CatalogItem(catalog : catalog);
        }
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key key,@required this.catalog})
      : assert(catalog !=null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatalogImage(image: catalog.image),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.xl.bold.make(),
                  ElevatedButton(
                    onPressed: (){},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        MyTheme.darkBluishColor,
                      ),
                      shape: MaterialStateProperty.all(
                        StadiumBorder(),
                      ),
                    ),
                    child: "Buy".text.make(),
                  )
                ],
              ).pOnly(right: 8.0)
            ],
          ))
        ],
      )
    ).white.roundedLg.square(150).make().py16();
  }
}



class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key key,@required this.image}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.rounded.p8.color(MyTheme.creamColor).make().p16().w40(context);
  }
}
