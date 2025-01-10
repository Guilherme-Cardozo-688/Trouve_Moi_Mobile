import 'package:flutter/material.dart';
import 'package:trouve_moi_mobile/apresentation/standart/maps.dart';

import '../standart/sla.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WaveClipPathExample(),
    );
  }
}
