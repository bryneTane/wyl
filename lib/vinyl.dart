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
    );
  }
}
