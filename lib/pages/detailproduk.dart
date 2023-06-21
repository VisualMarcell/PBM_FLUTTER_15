import 'package:flutter/material.dart';
import 'package:cobaa/styles/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:url_launcher/url_launcher.dart';

class Detailproduk extends StatefulWidget {
  Detailproduk({Key? key}) : super(key: key);

  @override
  State<Detailproduk> createState() => _DetailprodukState();
}

class _DetailprodukState extends State<Detailproduk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Detail Produk"),
          backgroundColor: Colors.black,
          toolbarHeight: 50,
        ),
        body: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: displayHeight(context) * 0.3,
                child: Image.asset(
                  'assets/images/produk4.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: displayHeight(context) * 0.1,
                width: displayWidth(context) * 1,
                padding: EdgeInsets.only(top: 10, left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 100,
                        child: Image.asset(
                          'assets/images/logo2.png',
                          width: 100,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    SizedBox(height: 9),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Nama : Monstera',
                        style: Styles.textBoldStyles,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 0, bottom: 15),
                color: Color.fromRGBO(238, 238, 238, 1),
                child: Container(
                  height: 50.0,
                  // width: displayWidth(context) * 0.4,
                  padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Harga : ',
                        style: Styles.text14BoldStyles,
                      ),
                      Text(
                        'RP. 150.0000',
                        style: Styles.text14BoldStyles,
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black26,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Deskipsi',
                            style: Styles.textStyles,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Monstera memiliki ciri daun tebal berwarna hijau dengan bolongan besar di daun-daunnya. Tanaman monstera biasanya cocok diletakkan di teras rumah, yang tidak langsung terpapar sinar matahari.',
                          style: Styles.text14Styles,
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            String url =
                "https://wa.me/+6281231908502/?text=Hello..Ada yang bisa saya bantu?";
            launch(url);
          },
          tooltip: 'Increment',
          child: FaIcon(FontAwesomeIcons.whatsapp),
          backgroundColor: Colors.green.shade800,
        ));
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
