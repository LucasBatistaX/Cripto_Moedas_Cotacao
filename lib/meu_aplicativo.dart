import 'package:aula_1/pages/moedas_pages.dart';
import 'package:flutter/material.dart';

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moedasbase',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.indigo),
        primarySwatch: Colors.indigo,
      ),
      home: MoedasPage(),
    );
  }
}
