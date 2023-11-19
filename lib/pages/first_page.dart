import 'package:flutter/material.dart';
import 'package:test_app/pages/calculator.dart';

class FirstPage extends StatefulWidget {
  FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _selectedIndex = 0;

  // update Selected index
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = [
    Calculator(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculator App")),
      body: _pages[0],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: _navigateBottomBar,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculate',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.graphic_eq), label: 'Graph')
        ],
      ),
      // drawer: Drawer(
      //   backgroundColor: Colors.deepPurple[200],
      //   child: Column(
      //     children: [
      //       DrawerHeader(
      //         child: Icon(
      //           Icons.favorite,
      //           size: 48,
      //         )
      //       ),
      //
      //       // home page list title
      //       ListTile(
      //         leading: Icon(Icons.home),
      //         title: Text("H O M E"),
      //         onTap: () {
      //           Navigator.pop(context);
      //           // go to home page
      //           Navigator.pushNamed(context, '/homepage');
      //         },
      //       ),
      //       // setting page list tile
      //       ListTile(
      //         leading: Icon(Icons.settings),
      //         title: Text("S E T T I N G S"),
      //         onTap: () {
      //           Navigator.pop(context);
      //           // go to settings page
      //           Navigator.pushNamed(context, '/settingspage');
      //         },
      //       )
      //     ],
      //   )
      // ),
    );
  }
}