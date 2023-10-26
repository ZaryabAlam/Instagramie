import 'package:flutter/material.dart';

// void showSnackbar(BuildContext context, String text) {
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       content: Text(text),
//       duration: Duration(seconds: 1),
//     ),
//   );
// } 
void showSnackbar(BuildContext context, String text, {SnackBarAction? action}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      duration: Duration(seconds: 1),
      action: action,
    ),
  );
}


const bold = TextStyle(fontWeight: FontWeight.bold);
const link = TextStyle(color: Color(0xFF3F729B));
