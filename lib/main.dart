import 'package:flutter/material.dart';
import 'pages/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( //Öğrenci başlıklı uygulama döner
      title: 'Ogrenci',
      home: HomeScreen(), //Pages klasöründe tanımlı sayfa düzeni alındı
    );
  }
}