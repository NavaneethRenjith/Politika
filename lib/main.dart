import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import './pages/auth_page.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Politika',
      theme: ThemeData(),
      home: AuthPage(),
    );
  }
}
