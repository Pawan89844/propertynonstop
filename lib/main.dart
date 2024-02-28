import 'package:flutter/material.dart';
import 'package:propertynonstop/View/auth/login.dart';
import 'package:firebase_core/firebase_core.dart' as firebase;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebase.Firebase.initializeApp();
  runApp(const PropertyNonStop());
}

class PropertyNonStop extends StatelessWidget {
  const PropertyNonStop({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Property Non Stop',
      theme: ThemeData(useMaterial3: true),
      home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}
