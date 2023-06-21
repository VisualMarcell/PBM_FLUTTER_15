import 'package:flutter/material.dart';
import 'package:cobaa/styles/styles.dart';

class Kategori extends StatefulWidget {
  Kategori({Key? key}) : super(key: key);

  @override
  State<Kategori> createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(top: 10, left: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 50.0),
                    child: Container(
                      child: Stack(
                        children: <Widget>[
                          Card(
                            child: SizedBox(
                              height: 70.0,
                              width: displayWidth(context) * 0.4,
                              // padding: EdgeInsets.only(top: 20, left: 10),
                              child: Padding(
                                padding: EdgeInsets.only(top: 20, left: 7),
                                child: Row(
                                  children: [
                                    Text(
                                      'Jual Tanaman',
                                      style: Styles.text14BoldStyles,
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.arrow_right,
                                        size: 30,
                                      ),
                                      onPressed: () => {
                                        Navigator.pushNamed(context, '/jual'),
                                      },
                                    )
                                    // Icon(
                                    //   Icons.arrow_right,
                                    //   size: 30,
                                    // ),
                                  ],
                                ),
                              ),
                              // decoration: BoxDecoration(
                              //     color: Colors.white,
                              //     border: Border.all(
                              //       color: Colors.black26,
                              //       width: 1,
                              //     )),
                            ),
                          ),
                          FractionalTranslation(
                            translation: Offset(0.8, -0.5),
                            child: Align(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 3,
                                        color: Colors.black26,
                                        spreadRadius: 2)
                                  ],
                                ),
                                child: CircleAvatar(
                                  radius: 30.0,
                                  backgroundColor: Colors.white,
                                  backgroundImage:
                                      AssetImage('assets/images/cat1.png'),
                                ),
                              ),
                              alignment: FractionalOffset(0.0, 0.9),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50.0, left: 10),
                    child: Container(
                      child: Stack(
                        children: <Widget>[
                          Card(
                            child: SizedBox(
                              height: 70.0,
                              width: displayWidth(context) * 0.4,
                              // padding: EdgeInsets.only(top: 20, left: 10),
                              child: Padding(
                                padding: EdgeInsets.only(top: 20, left: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      'Beli Tanaman',
                                      style: Styles.text14BoldStyles,
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.arrow_right,
                                        size: 30,
                                      ),
                                      onPressed: () => {
                                        Navigator.pushNamed(context, '/beli'),
                                      },
                                    )
                                    // Icon(
                                    //   Icons.arrow_right,
                                    //   size: 30,
                                    // ),
                                  ],
                                ),
                              ),
                              // decoration: BoxDecoration(
                              //     color: Colors.white,
                              //     border: Border.all(
                              //       color: Colors.black26,
                              //       width: 1,
                              //     )),
                            ),
                          ),
                          FractionalTranslation(
                            translation: Offset(0.8, -0.5),
                            child: Align(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 3,
                                        color: Colors.black26,
                                        spreadRadius: 2)
                                  ],
                                ),
                                child: CircleAvatar(
                                  radius: 30.0,
                                  backgroundColor: Colors.white,
                                  backgroundImage:
                                      AssetImage('assets/images/cat2.png'),
                                ),
                              ),
                              alignment: FractionalOffset(0.0, 0.9),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
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
