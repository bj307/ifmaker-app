import 'package:flutter/material.dart';
import 'package:ifmaker_app/src/auth/tela_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IF Maker APP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 241, 28, 13)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const TelaLogin(),
    );
  }
}
