import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cobaa/componets/produk_beli_grid.dart';
import 'package:cobaa/componets/search.dart';
import 'package:cobaa/styles/styles.dart';

class Beli extends StatefulWidget {
  Beli({Key? key}) : super(key: key);

  @override
  State<Beli> createState() => _BeliState();
}

class _BeliState extends State<Beli> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beli Tanaman', style: Styles.header2Styles),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          Container(
              padding: EdgeInsets.only(right: 10),
              child: IconButton(
                icon: Icon(
                  CupertinoIcons.cart,
                  size: 30,
                ),
                onPressed: () {},
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: displayHeight(context) * 0.1,
              child: Search(),
            ),
            Container(
              margin: EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 10),
              color: Colors.black12,
              height: 2,
            ),
            Container(
              height: displayHeight(context) * 1,
              child: ProdukBeliGrid(),
            )
          ],
        ),
      ),
    );
  }
}

Size displaySize(BuildContext context) {
  debugPrint('Size = ' + MediaQuery.of(context).size.toString());
  return MediaQuery.of(context).size;
}

double displayHeight(BuildContext context) {
  debugPrint('Height = ' + displaySize(context).height.toString());
  return displaySize(context).height;
}

double displayWidth(BuildContext context) {
  debugPrint('Width = ' + displaySize(context).width.toString());
  return displaySize(context).width;
}
