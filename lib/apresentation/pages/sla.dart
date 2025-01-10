import 'package:flutter/material.dart';

class PageViewWithBottomNavBar extends StatefulWidget {
  @override
  _PageViewWithBottomNavBarState createState() =>
      _PageViewWithBottomNavBarState();
}

class _PageViewWithBottomNavBarState extends State<PageViewWithBottomNavBar> {
  PageController _pageController = PageController();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index); // Muda de página no PageView
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
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
              child: Text(
                'Tela 1',
                style: TextStyle(fontSize: 32, color: Colors.white),
              ),
            ),
          ),
          // Tela 2
          Container(
            color: Colors.green,
            child: Center(
              child: Text(
                'Tela 2',
                style: TextStyle(fontSize: 32, color: Colors.white),
              ),
            ),
          ),
          // Tela 3
          Container(
            color: Colors.red,
            child: Center(
              child: Text(
                'Tela 3',
                style: TextStyle(fontSize: 32, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
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
