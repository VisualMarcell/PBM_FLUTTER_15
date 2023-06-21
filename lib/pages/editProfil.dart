import 'package:flutter/material.dart';
import 'package:cobaa/styles/styles.dart';

class EditProfil extends StatefulWidget {
  EditProfil({Key? key}) : super(key: key);

  @override
  State<EditProfil> createState() => _EditProfilState();
}

class _EditProfilState extends State<EditProfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit profil Saya',
          style: Styles.header2Styles,
        ),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Color.fromRGBO(239, 239, 239, 1),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    color: Colors.black38,
                    spreadRadius: 1,
                  )
                ],
              ),
              child: CircleAvatar(
                radius: 40.0,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 15.0,
                      child: IconButton(
                        icon: Icon(
                          Icons.camera_alt,
                          size: 20.0,
                          color: Color(0xFF404040),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/editfotoprofil');
                        },
                      ),
                    ),
                  ),
                  radius: 45.0,
                  backgroundImage: AssetImage('assets/images/imgProfil.png'),
                ),
              ),
            ),
            Container(
              height: displayHeight(context) * 0.7,
              padding: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    autofocus: false,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: 'Masukkan Username',
                      filled: true,
                      fillColor: Color.fromRGBO(239, 239, 239, 1),
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      enabledBorder: myfocusborder(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 35,
                    width: displayWidth(context) * 0.9,
                    child: ElevatedButton(
                      child: Text(
                        "Simpan Perubahan",
                        style: Styles.textBOldWhiteStyles,
                      ),
                      onPressed: () => {
                        Navigator.pushNamed(context, '/bottomnavbar'),
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).colorScheme.secondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Informasi Kontak',
                            style: Styles.text14BoldStyles,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Informasi kontak anda akan digunakan untuk menginformasikan tentang aktifitas Anda di DEPLANTS.',
                            style: Styles.text14Styles,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email : ',
                      style: Styles.text14Styles,
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    autofocus: false,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      filled: true,
                      fillColor: Color.fromRGBO(239, 239, 239, 1),
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      enabledBorder: myfocusborder(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Alamat : ',
                      style: Styles.text14Styles,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/gmaps');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Jember',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black54,
                            ),
                          ),
                          Icon(
                            Icons.arrow_right,
                            size: 35,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(239, 239, 239, 1),
                        ),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: BorderSide(color: Colors.black54),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Password : ',
                      style: Styles.text14Styles,
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    autofocus: false,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: 'password',
                      filled: true,
                      fillColor: Color.fromRGBO(239, 239, 239, 1),
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      enabledBorder: myfocusborder(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
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
