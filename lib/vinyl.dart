import 'package:flutter/material.dart';

class ImageRotate extends StatefulWidget {
  const ImageRotate({super.key});

  @override
  _ImageRotateState createState() => _ImageRotateState();
}

class _ImageRotateState extends State<ImageRotate>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 7),
    );

    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            child: Container(
              alignment: Alignment.center,
              // color: Colors.white,
              child: AnimatedBuilder(
                animation: animationController,
                child: SizedBox(
                  height: 350,
                  width: 350,
                  child: Image.asset('images/vinyl.png'),
                ),
                builder: (BuildContext context, Widget? widget) {
                  return Transform.rotate(
                    angle: animationController.value * 6.3,
                    child: widget,
                  );
                },
              ),
            ),
          ),
          Positioned(
            left: (MediaQuery.of(context).size.width / 2) - 50,
            top: 125,
            child: Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(300),
                  color: Colors.orange,
                ),
                clipBehavior: Clip.hardEdge,
                child: AnimatedBuilder(
                  animation: animationController,
                  child: Image.asset(
                    "images/test.jpg",
                    fit: BoxFit.cover,
                  ),
                  builder: (BuildContext context, Widget? widget) {
                    return Transform.rotate(
                      angle: animationController.value * 6.3,
                      child: widget,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
