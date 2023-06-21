import 'package:flutter/material.dart';
import 'package:cobaa/styles/styles.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool hidePassword = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void register() async {
    var url =
        "http://10.0.2.2/flutter_application_deplants/lib/helpers/register.php";

    var response = await http.post(Uri.parse(url), body: {
      "nama": nameController.text,
      "username": usernameController.text,
      "email": emailController.text,
      "password": passwordController.text
    });

    if (response.statusCode == 200) {
      // Registrasi berhasil
      print("Registrasi berhasil");
    } else {
      // Terjadi kesalahan dalam registrasi
      print("Terjadi kesalahan dalam registrasi");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text('REGISTER'),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 50),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          padding: EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Name',
                    style: Styles.header3Styles,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: nameController,
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: 'Masukkan Name',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  enabledBorder: myfocusborder(),
                ),
              ),
              SizedBox(
                height: 20,
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
                controller: usernameController,
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: 'Masukkan Username',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  enabledBorder: myfocusborder(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Email',
                    style: Styles.header3Styles,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: 'Masukkan Email',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  enabledBorder: myfocusborder(),
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
                controller: passwordController,
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                obscureText: hidePassword,
                // initialValue: 'Password',
                decoration: InputDecoration(
                  hintText: 'Masukkan Password',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
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
                height: 40,
              ),
              SizedBox(
                height: 50,
                width: displayWidth(context) * 0.5,
                child: ElevatedButton(
                  child: Text(
                    "Register",
                    style: Styles.button1Styles,
                  ),
                  onPressed: () => {
                    register(),
                    Navigator.pop(context),
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
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
