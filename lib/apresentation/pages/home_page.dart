import 'package:flutter/material.dart';
import 'package:trouve_moi_mobile/apresentation/standart/app_bar_costume.dart';

import 'user_map_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    final double icon = MediaQuery.of(context).size.height * 0.035;
    return Scaffold(
      appBar: AppBarCostume(),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            children: [
              // Tela 1
              Container(
                color: Colors.blue,
                child: Center(
                  child: UserMapPage(),
                ),
              ),
              // Tela 2
              Container(
                color: Colors.green,
                child: const Center(
                  child: Text(
                    'Tela 2',
                    style: TextStyle(fontSize: 32, color: Colors.white),
                  ),
                ),
              ),
              // Tela 3
              Container(
                color: Colors.red,
                child: const Center(
                  child: Text(
                    'Tela 3',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: icon,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Mapa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shield),
            label: 'Proteção',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Itens',
          ),
        ],
      ),
    );
  }
}
