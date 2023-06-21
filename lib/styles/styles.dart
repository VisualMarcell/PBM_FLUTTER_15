import 'package:flutter/material.dart';

class Styles {
  // declare two fonts into separate varibales
  static final String trojanFont = 'Roboto';
  // static final String schylerFont = 'Schyler';

  // header style

  static final TextStyle header1Styles = TextStyle(
    color: Colors.black,
    fontFamily: 'Roboto',
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle header1WhiteStyles = TextStyle(
    color: Colors.white,
    fontFamily: 'Roboto',
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle header2Styles = TextStyle(
    color: Colors.black,
    fontFamily: 'Roboto',
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle header3Styles = TextStyle(
    color: Colors.black,
    fontFamily: 'Roboto',
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle textStyles = TextStyle(
    color: Colors.black,
    fontFamily: 'Roboto',
    fontSize: 16.0,
  );
  static final TextStyle text20Styles = TextStyle(
    color: Colors.black,
    fontFamily: 'Roboto',
    fontSize: 20.0,
  );

  static final TextStyle textBoldStyles = TextStyle(
    color: Colors.black,
    fontFamily: 'Roboto',
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle text14BoldStyles = TextStyle(
    color: Colors.black,
    fontFamily: 'Roboto',
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle text14Styles = TextStyle(
    color: Colors.black,
    fontFamily: 'Roboto',
    fontSize: 14.0,
  );
  static final TextStyle textBlueStyles = TextStyle(
    color: Colors.blue,
    fontFamily: 'Roboto',
    fontSize: 16.0,
  );

  static final TextStyle textGreenStyles = TextStyle(
    color: Color.fromRGBO(44, 156, 46, 1),
    fontFamily: 'Roboto',
    fontSize: 16.0,
  );

  static final TextStyle textWhiteStyles = TextStyle(
    color: Colors.white,
    fontFamily: 'Roboto',
    fontSize: 16.0,
  );
  static final TextStyle textBOldWhiteStyles = TextStyle(
      color: Colors.white,
      fontFamily: 'Roboto',
      fontSize: 16.0,
      fontWeight: FontWeight.bold);

  // extend the header style into body
  // static final bodyStyle = extend(header1Styles,
  //     TextStyle(fontSize: 40, decoration: TextDecoration.underline));

  static final TextStyle button1Styles = TextStyle(
    color: Colors.white,
    fontFamily: 'Roboto',
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle button2Styles = TextStyle(
    color: Colors.white,
    fontFamily: 'Roboto',
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
  );
}
