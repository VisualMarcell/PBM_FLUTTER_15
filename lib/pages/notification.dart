import 'package:flutter/material.dart';
import 'package:cobaa/styles/styles.dart';

class Notif extends StatefulWidget {
  Notif({Key? key}) : super(key: key);

  @override
  State<Notif> createState() => _NotifState();
}

class _NotifState extends State<Notif> {
  @override
  Widget build(BuildContext context) {
    final List<String> listView = <String>[
      'Sukses!!! Produk Kamu Berhasil Di Iklankan!!!',
      'Jangan Lupa Pantau Produk Kamu Ya!!!',
      'Selamat Datang Di DEPLANTS, Jual Beli Mudah....'
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Notifikasi', style: Styles.header2Styles),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: listView.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Color.fromRGBO(238, 238, 238, 1),
            borderOnForeground: true,
            elevation: 5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Text(
                    "${listView[index]}",
                    style: Styles.textStyles,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
