import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: TextFormField(
        onChanged: (value) {
          print(value);
        },
        keyboardType: TextInputType.emailAddress,
        autofocus: false,

        // initialValue: 'Password',
        decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromRGBO(238, 238, 238, 1),
          hintText: 'cari tanaman',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          prefixIcon: IconButton(
            icon: Icon(
              Icons.search,
            ),
            color: Colors.black38,
            onPressed: () {},
          ),
          enabledBorder: myfocusborder(),
        ),
      ),
    );
  }
}

OutlineInputBorder myfocusborder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
    borderSide: BorderSide(width: 1, color: Colors.black45),
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
