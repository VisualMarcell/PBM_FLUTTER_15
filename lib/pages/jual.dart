import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cobaa/styles/styles.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class JualProduk extends StatefulWidget {
  JualProduk({Key? key}) : super(key: key);

  @override
  State<JualProduk> createState() => _JualProdukState();
}

class _JualProdukState extends State<JualProduk> {
  File? _image;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Jual Tanaman',
            style: Styles.header2Styles,
          ),
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          toolbarHeight: 40,
        ),
        body: SingleChildScrollView(
          // padding: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: displayHeight(context) * 0.2,
                // height: 90,
                width: displayWidth(context) * 1,
                child: Align(
                  child: Container(
                      width: 200,
                      height: 120,
                      decoration: BoxDecoration(
                        // color: Colors.white,
                        // shape: BoxShape.circle,
                        image: new DecorationImage(
                          image: new AssetImage('assets/images/camera.png'),
                          // fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 3,
                              color: Colors.black26,
                              spreadRadius: 2)
                        ],
                      ),
                      child: Column(children: [
                        if (_image != null)
                          Expanded(
                            child: Container(
                              // width: 200,
                              // margin: EdgeInsets.only(left: 40, right: 40),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: FileImage(_image!),
                                  // fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                      ])),
                  alignment: FractionalOffset(0.5, 0.7),
                ),
              ),
              SizedBox(height: 10),
              Container(
                  color: Theme.of(context).colorScheme.primary,
                  height: displayHeight(context) * 0.8,
                  width: displayWidth(context),
                  padding: EdgeInsets.only(top: 30, left: 20, right: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 60,
                            width: displayWidth(context) * 0.4,
                            child: ElevatedButton(
                              child: Column(
                                children: [
                                  SizedBox(height: 10),
                                  Icon(
                                    Icons.camera_alt,
                                    size: 25,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    "Ambil Foto",
                                    style: Styles.textBoldStyles,
                                  ),
                                ],
                              ),
                              onPressed: () async {
                                // Buka kamera untuk mengambil gambar
                                await _pickImage(ImageSource.camera);

                                if (_image != null) {}
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(217, 217, 217, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 30),
                          SizedBox(
                            height: 60,
                            width: displayWidth(context) * 0.4,
                            child: ElevatedButton(
                              child: Column(
                                children: [
                                  SizedBox(height: 10),
                                  Icon(
                                    CupertinoIcons.photo_fill,
                                    size: 25,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    "Pilih Foto",
                                    style: Styles.textBoldStyles,
                                  ),
                                ],
                              ),
                              onPressed: () async {
                                // Buka galeri untuk memilih gambar
                                await _pickImage(ImageSource.gallery);

                                if (_image != null) {
                                  // Lakukan sesuatu dengan gambar yang dipilih
                                  // Misalnya, tampilkan gambar dalam widget Image
                                  // atau unggah ke server
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(217, 217, 217, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Nama tanaman : ',
                              style: Styles.text14Styles,
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            autofocus: false,
                            maxLines: 1,
                            decoration: InputDecoration(
                              hintText: 'Masukaan Nama ',
                              filled: true,
                              fillColor: Color.fromRGBO(239, 239, 239, 1),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              enabledBorder: myfocusborder(),
                              // focusedBorder: myunderlineborder(),
                              // border: UnderlineInputBorder(),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Ukuran Tanaman : ',
                              style: Styles.text14Styles,
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            autofocus: false,
                            maxLines: 1,
                            decoration: InputDecoration(
                              hintText: 'Masukkan Ukuran',
                              filled: true,
                              fillColor: Color.fromRGBO(239, 239, 239, 1),

                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              enabledBorder: myfocusborder(),
                              // focusedBorder: myunderlineborder(),
                              // border: UnderlineInputBorder(),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Stock : ',
                              style: Styles.text14Styles,
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            autofocus: false,
                            maxLines: 1,
                            decoration: InputDecoration(
                              hintText: 'Masukkan Jumlah Stok',
                              filled: true,
                              fillColor: Color.fromRGBO(239, 239, 239, 1),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              enabledBorder: myfocusborder(),
                              // focusedBorder: myunderlineborder(),
                              // border: UnderlineInputBorder(),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Harga : ',
                              style: Styles.text14Styles,
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            autofocus: false,
                            maxLines: 1,
                            decoration: InputDecoration(
                              hintText: 'Masukkan Harga',
                              filled: true,
                              fillColor: Color.fromRGBO(239, 239, 239, 1),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              enabledBorder: myfocusborder(),
                              // focusedBorder: myunderlineborder(),
                              // border: UnderlineInputBorder(),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Whasapp : ',
                              style: Styles.text14Styles,
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            autofocus: false,
                            maxLines: 1,
                            decoration: InputDecoration(
                              hintText: 'Masukkan No Whatapp',
                              filled: true,
                              fillColor: Color.fromRGBO(239, 239, 239, 1),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              enabledBorder: myfocusborder(),
                              // focusedBorder: myunderlineborder(),
                              // border: UnderlineInputBorder(),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              height: 30,
                              width: 70,
                              child: ElevatedButton(
                                child: Text(
                                  "Post",
                                  style: Styles.textBOldWhiteStyles,
                                ),
                                onPressed: () => {
                                  Navigator.pushNamed(context, '/home'),
                                },
                                style: ElevatedButton.styleFrom(
                                  primary:
                                      Theme.of(context).colorScheme.secondary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  )),
            ],
          ),
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

OutlineInputBorder myfocusborder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
    borderSide: BorderSide(width: 1, color: Color.fromRGBO(76, 61, 61, 1)),
  );
}

UnderlineInputBorder myunderlineborder() {
  return UnderlineInputBorder(
    borderSide: BorderSide(color: Color.fromRGBO(76, 61, 61, 1)),
    //  when the TextFormField in focused
  );
}
