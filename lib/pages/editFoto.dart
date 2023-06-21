import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cobaa/styles/styles.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditFoto extends StatefulWidget {
  EditFoto({Key? key}) : super(key: key);

  @override
  State<EditFoto> createState() => _EditFotoState();
}

class _EditFotoState extends State<EditFoto> {
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
          'Edit Foto Profil',
          style: Styles.header2Styles,
        ),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Color.fromRGBO(239, 239, 239, 1),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Masukkan foto Profil Anda',
                style: Styles.textBoldStyles,
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage('assets/images/imgProfil.png'),
                  // fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 2,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: ClipOval(
                child: _image != null
                    ? Image.file(
                        _image!,
                        fit: BoxFit.cover,
                      )
                    : Container(),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  height: 70,
                  width: displayWidth(context) * 0.4,
                  child: ElevatedButton(
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Icon(
                          Icons.camera_alt,
                          size: 35,
                          color: Colors.black,
                        ),
                        Text(
                          "Ambil Foto",
                          style: Styles.textBoldStyles,
                        ),
                      ],
                    ),
                    onPressed: () async {
                      await _pickImage(ImageSource.camera);
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
                  height: 70,
                  width: displayWidth(context) * 0.4,
                  child: ElevatedButton(
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Icon(
                          CupertinoIcons.photo_fill,
                          size: 35,
                          color: Colors.black,
                        ),
                        Text(
                          "Pilih Foto",
                          style: Styles.textBoldStyles,
                        ),
                      ],
                    ),
                    onPressed: () async {
                      await _pickImage(ImageSource.gallery);
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
            SizedBox(height: 50),
            SizedBox(
              height: 35,
              width: displayWidth(context) * 0.9,
              child: ElevatedButton(
                child: Text(
                  "Simpan",
                  style: Styles.textBOldWhiteStyles,
                ),
                onPressed: () => {
                  Navigator.pushNamed(context, '/editProfil'),
                },
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).colorScheme.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

OutlineInputBorder myfocusborder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: BorderSide(width: 1, color: Color.fromRGBO(76, 61, 61, 1)),
  );
}

UnderlineInputBorder myunderlineborder() {
  return UnderlineInputBorder(
    borderSide: BorderSide(color: Color.fromRGBO(76, 61, 61, 1)),
    //  when the TextFormField in focused
  );
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
