import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cobaa/styles/styles.dart';
import 'package:http/http.dart' as http;

String username = '';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool hidePassword = true;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String msg = '';

  Future<void> _login() async {
    final url =
        'http://10.0.2.2/flutter_application_deplants/lib/helpers/login.php';
    final response = await http.post(Uri.parse(url), body: {
      "username": usernameController.text,
      "password": passwordController.text,
    });

    var datauser = json.decode(response.body);
    // print(response.body);

    if (datauser.isNotEmpty) {
      // Login berhasil
      // msg = "Login Sukses";
      Navigator.pushReplacementNamed(context, '/bottomnavbar');

      setState(() {
        username = datauser[0]['username'];
      });
    } else {
      // Login gagalad
      setState(() {
        msg = "Login gagal!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              // alignment: Alignment.center,
              margin: EdgeInsets.only(top: 20, bottom: 50),
              child: Image.asset(
                'assets/images/logo.png',
                width: displayWidth(context) * 0.5,
              ),
            ),
            Container(
              height: 380,
              // height: displayHeight(context) * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              padding: EdgeInsets.only(left: 15.0, top: 20.0, right: 15.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Username',
                        style: Styles.header3Styles,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    autofocus: false,
                    controller: usernameController,
                    decoration: InputDecoration(
                      hintText: 'Masukkan Username',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      enabledBorder: myfocusborder(),
                      // focusedBorder: myunderlineborder(),
                      // border: UnderlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'Password',
                        style: Styles.header3Styles,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      print(value);
                    },
                    keyboardType: TextInputType.emailAddress,
                    controller: passwordController,
                    autofocus: false,
                    obscureText: hidePassword,
                    // initialValue: 'Password',
                    decoration: InputDecoration(
                      hintText: 'Masukkan Password',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      suffixIcon: IconButton(
                        icon: hidePassword
                            ? Icon(
                                Icons.visibility_off,
                                color: Color.fromRGBO(76, 61, 61, 1),
                              )
                            : Icon(
                                Icons.visibility,
                                color: Color.fromRGBO(76, 61, 61, 1),
                              ),
                        onPressed: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                      ),
                      enabledBorder: myfocusborder(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      msg,
                      style: TextStyle(fontSize: 16, color: Colors.red),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    width: displayWidth(context) * 0.5,
                    child: ElevatedButton(
                      child: Text(
                        "Login",
                        style: Styles.button1Styles,
                      ),
                      onPressed: () => {
                        _login()
                        // Navigator.pushNamed(context, '/bottomnavbar'),
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'dont’have an account?',
                        style: Styles.textStyles,
                        textAlign: TextAlign.center,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("Register", style: Styles.textBlueStyles),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
}
