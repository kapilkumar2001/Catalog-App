import 'package:catalog_app2/models/catalog.dart';
import 'package:catalog_app2/pages/add_to_cart.dart';
import 'package:catalog_app2/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key key,@required this.catalog})
      : assert(catalog != null),
        super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor : context.canvasColor,
        bottomNavigationBar: Container(
          color: context.cardColor,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              "\$${catalog.price}".text.xl4.red800.bold.make(),
              AddToCart(catalog: catalog,).wh(120,50)
            ],
          ).p32(),
        ),
        body: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image)
            ).h32(context),
            Expanded(
                child: VxArc(
                  height: 30.0,
                  arcType: VxArcType.CONVEY,
                  edge: VxEdge.TOP,
                  child: Container(
                    color: context.cardColor,
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        catalog.name.text.xl4.color(context.accentColor).bold.make(),
                        catalog.desc.text.textStyle(context.captionStyle).color(context.accentColor).xl.make(),
                        10.heightBox,
                        "Released 2020, October 23, 164g, 7.4mm thickness, iOS 14.1, up to iOS 14.4, 64GB/128GB/256GB, storage, no card slot, Glass front (Gorilla Glass), glass back (Gorilla Glass), aluminum frame, Single SIM (Nano-SIM and/or eSIM) or Dual SIM (Nano-SIM, dual stand-by) - for China, Apple Pay (Visa, MasterCard, AMEX certified), Super Retina XDR OLED, HDR10, 625 nits (typ), 1200 nits (peak), 64GB 4GB RAM, 128GB 4GB RAM, 256GB 4GB RAM".text.textStyle(context.captionStyle).color(context.accentColor).make().p16(),
                      ],
                    ).py64(),
                  ),
                ),
            ),
          ],
        ).p16(),
      ),
    );
  }
}
