import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'home_page.dart';

const request = "https://api.hgbrasil.com/finance?format=json&key=9a1557fa";

// var url = Uri.parse('https://example.com/whatsit/create');

void main() async {
  print(await getData());
  runApp(MaterialApp(
    home: const Home(),
    theme: CorTema(),
  ));
}

ThemeData CorTema() {
  return ThemeData(
    hintColor: Colors.amber,
    primaryColor: Colors.white,
    inputDecorationTheme: const InputDecorationTheme(
      enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
      hintStyle: TextStyle(color: Colors.amber),
    ),
  );
}

Future<Map> getData() async {
  http.Response response = await http.get(Uri.parse(request));
  return json.decode(response.body);
}
