import 'package:Wyl/vinyl.dart';
import 'package:flutter/material.dart';

class Music extends StatelessWidget {
  const Music({super.key});

  // Fields in a Widget subclass are always marked "final".

  @override
  Widget build(BuildContext context) {
    return Column(
      // Column is also a layout widget. It takes a list of children and
      // arranges them vertically. By default, it sizes itself to fit its
      // children horizontally, and tries to be as tall as its parent.
      //
      // Invoke "debug painting" (press "p" in the console, choose the
      // "Toggle Debug Paint" action from the Flutter Inspector in Android
      // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
      // to see the wireframe for each widget.
      //
      // Column has various properties to control how it sizes itself and
      // how it positions its children. Here we use mainAxisAlignment to
      // center the children vertically; the main axis here is the vertical
      // axis because Columns are vertical (the cross axis would be
      // horizontal).
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Stack(
          children: [
            Container(
              // grey box
              height: 400,
              // color: Colors.grey[300],
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/xanxus.jpeg"),
                    fit: BoxFit.cover,
                    alignment: Alignment(-1, -0.8)),
              ),
            ),
            Container(
              height: 400,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: <Color>[Colors.black, Colors.transparent],
                    stops: [0.0, 1.0]
                    // tileMode: TileMode.mirror,
                    ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 95,
              child: const Center(
                child: Text(
                  'Lorem ipsum sit dolor',
                ),
              ),
            ),
            Align(
                alignment: Alignment.center,
                child: Container(
                    margin: const EdgeInsets.only(top: 225),
                    child: const ImageRotate())),
          ],
        ),
      ],
    );
  }
}
