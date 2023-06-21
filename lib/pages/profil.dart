import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cobaa/pages/login.dart';
import 'package:cobaa/styles/styles.dart';
import 'package:http/http.dart' as http;

class Profil extends StatefulWidget {
  final String username;

  Profil({Key? key, required this.username}) : super(key: key);

  @override
  _ProfilState createState() => _ProfilState();
}

class User {
  final String nama;
  final String username;
  final String email;
  final String password;

  User({
    required this.nama,
    required this.username,
    required this.email,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      nama: json['nama'].toString(),
      username: json['username'].toString(),
      email: json['email'].toString(),
      password: json['password'].toString(),
    );
  }
}

class _ProfilState extends State<Profil> {
  User? user;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    var url =
        "http://10.0.2.2/flutter_application_deplants/lib/helpers/getdata.php?username=${widget.username}";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data is List && data.isNotEmpty) {
        var userData = data.firstWhere(
            (item) => item['username'] == widget.username,
            orElse: () => null);
        if (userData != null) {
          var fetchedUser = User.fromJson(userData);
          setState(() {
            user = fetchedUser;
            isLoading = false;
          });
        } else {
          setState(() {
            isLoading = false;
          });
        }
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } else {
      setState(() {
        isLoading = false;
      });
      print("Terjadi kesalahan saat mengambil data");
    }
  }

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
            toolbarHeight: 135,
            backgroundColor: Colors.transparent,
            bottom: PreferredSize(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 16.0),
                child: Text("Hiasi Tamanmu dengan Hiasan Tanaman yang Menawan",
                    style: Styles.textBOldWhiteStyles),
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
                  height: 40,
                ),
                SizedBox(height: 50),
                SizedBox(
                  height: 50,
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
                    onPressed: () =>
                        {Navigator.pushReplacementNamed(context, '/login')},
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
                    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Row(
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
                              radius: 45.0,
                              backgroundImage:
                                  AssetImage('assets/images/imgProfil.png'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Hai, $username',
                                  style: Styles.header2Styles,
                                ),
                              ),
                              SizedBox(height: 5),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, '/editProfil');
                                    },
                                    child: Text(
                                      "Ubah Profil",
                                      style: Styles.textStyles,
                                    ),
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 5),
                    height: 2,
                    color: Colors.grey,
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    width: 500,
                    child: isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : user != null
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Nama: ${user!.nama}",
                                    style: Styles.textStyles,
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    height: 1,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    "Username: ${user!.username}",
                                    style: Styles.textStyles,
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    height: 1,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    "Email: ${user!.email}",
                                    style: Styles.textStyles,
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    height: 1,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    "Alamat: Jember",
                                    style: Styles.textStyles,
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    height: 1,
                                    color: Colors.grey,
                                  ),
                                ],
                              )
                            : Center(
                                child: Text('Data tidak tersedia'),
                              ),
                  )
                ],
              ),
            ),
          ),
        ),
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
