import 'package:flutter/material.dart';

class ProdukBeliGrid extends StatefulWidget {
  ProdukBeliGrid({Key? key}) : super(key: key);

  @override
  State<ProdukBeliGrid> createState() => _ProdukBeliGridState();
}

class _ProdukBeliGridState extends State<ProdukBeliGrid> {
  List<Card> _buildGridCards(int count) {
    List<Card> cards = List.generate(
      count,
      (int index) {
        return Card(
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/detailProduk');
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 12.0 / 11.0,
                  child: Image.asset(
                    'assets/images/produk5.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text('Monstera',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(height: 8.0),
                      Text('Ukuran Besar'),
                      SizedBox(height: 2.0),
                      Text('Stock : 50'),
                      SizedBox(height: 8.0),
                      Text('Rp. 150.000'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        childAspectRatio: 5.0 / 8.0,
        children: _buildGridCards(10), // Replace
      ),
    );
  }
}
