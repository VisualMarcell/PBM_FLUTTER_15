import 'package:flutter/material.dart';
import 'package:cobaa/componets/kategori.dart';
import 'package:cobaa/componets/search.dart';
import 'package:cobaa/styles/styles.dart';
import 'package:cobaa/componets/produk_grid.dart';

class Home extends StatelessWidget {
  final String username;

  const Home({Key? key, required this.username}) : super(key: key);

  // Home({required this.username});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/bg1.png',
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            toolbarHeight: 100,
            backgroundColor: Colors.transparent,
            // flexibleSpace: Container(
            //   decoration: BoxDecoration(
            //       image: DecorationImage(
            //           image: AssetImage('assets/images/bg1.png'),
            //           fit: BoxFit.fill)),
            // ),
            bottom: PreferredSize(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 16.0),
                child: Text("Selamat Datang di DEPLANTS",
                    style: Styles.header1WhiteStyles),
              ),
              preferredSize: Size(0.0, 80.0),
            ),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.only(top: 50),
              children: [
                Image.asset(
                  'assets/images/logo2.png',
                  // width: 124,
                  height: 40,
                ),
                SizedBox(height: 50),
                SizedBox(
                  height: 50,
                  // width: displayWidth(context) * 0.7,

                  child: ElevatedButton(
                    child: Wrap(
                      children: [
                        Icon(
                          Icons.logout,
                          size: 24,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Log Out",
                          style: Styles.header2Styles,
                        ),
                      ],
                    ),
                    onPressed: () => {
                      // Navigator.pushNamed(context, '/login'),
                      Navigator.pushReplacementNamed(context, '/login')
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: displayHeight(context) * 0.09,
                    width: displayWidth(context) * 1,
                    child: Search(),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Senang bertemu dengan Anda, ',
                              style: Styles.header2Styles,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '$username',
                              style: Styles.header2Styles,
                            ),
                          )
                        ],
                      )),
                  Container(
                    height: displayHeight(context) * 0.2,
                    width: displayWidth(context) * 1,
                    child: Kategori(),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20, bottom: 5),
                        child: Text(
                          'Rekomendasi',
                          style: Styles.header2Styles,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: displayHeight(context) * 1,
                    width: displayWidth(context) * 1,
                    child: ProdukGrid(),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
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
