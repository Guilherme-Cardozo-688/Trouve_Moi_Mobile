import 'package:flutter/material.dart';
import 'package:trouve_moi_mobile/apresentation/pages/cadastro_pessoa_page.dart';
import 'package:trouve_moi_mobile/apresentation/pages/home_page.dart';
import 'package:trouve_moi_mobile/apresentation/pages/login_page.dart';

import 'apresentation/pages/sla.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CadastroPessoa(),
    );
  }
}
