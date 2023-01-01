import 'dart:developer';

import 'package:Wyl/music.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.navIndex});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final int navIndex;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _onItemTapped(int index) {
    Navigator.pushNamed(context, _getRouteFromIndex(index));
  }

  String _getRouteFromIndex(int index) {
    switch (index) {
      case 0:
        return "/friends";
      case 1:
        return "/home";
      case 2:
        return "/profile";
      default:
        return "/home";
    }
  }

  final bodyWidgets = [
    const Icon(Icons.people),
    const Music(),
    const Icon(Icons.person)
  ];

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color.fromARGB(45, 85, 179, 128),
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Friends',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: widget.navIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        selectedIconTheme: const IconThemeData(size: 30),
        onTap: _onItemTapped,
      ),
      endDrawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: Stack(children: [
        Center(child: bodyWidgets[widget.navIndex]),
        Positioned(
          right: 20,
          top: 40,
          child: IconButton(
            color: Colors.white,
            icon: const Icon(Icons.menu),
            onPressed: () => scaffoldKey.currentState?.openEndDrawer(),
          ),
        ),
      ]),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.music_note_rounded),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
