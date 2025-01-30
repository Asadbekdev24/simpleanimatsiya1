import 'dart:developer';

import 'package:flutter/material.dart';

class Matritsa extends StatefulWidget {
  const Matritsa({super.key});

  @override
  State<Matritsa> createState() => _MatritsaState();
}

class _MatritsaState extends State<Matritsa> with SingleTickerProviderStateMixin {
  bool isOntab = false;
  late AnimationController _animationController;
  late Animation<Size> _cubeSizeAnimation;
  late Animation<Color?> _circleColorAnimation;
  late Animation<Offset> _positionedAnimation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _cubeSizeAnimation = Tween<Size>(begin: Size(150, 150), end: Size(450, 450))
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.easeInOut));
    _circleColorAnimation = ColorTween(begin: Colors.amber, end: Colors.blue)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.easeInOut));

    _positionedAnimation =
        Tween<Offset>(begin: Offset(-8.0, 0.0), end: Offset(4.0, 0.0)).animate(
            CurvedAnimation(
                parent: _animationController, curve: Curves.bounceInOut));

    // _cubeSizeAnimation.addListener(() {
    //   setState(() {});
    // });

    // _circleColorAnimation.addListener(() {
    //   setState(() {});
    // });

    _animationController.forward();
  }

  void toggleSize() {
    if (isOntab) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }

    isOntab = !isOntab;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("salom");
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(child: const Text("Run")),
      ),
      body: Column(
        children: [
          Center(
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                print("salom 2025");
                return Transform.translate(
                  offset: _positionedAnimation.value,
                  child: Container(
                height: _cubeSizeAnimation.value.height,
                width: _cubeSizeAnimation.value.width,
                decoration: BoxDecoration(
                    color: _circleColorAnimation.value, shape: BoxShape.circle),
              ),
                );
              },

            ),
          ),
          ElevatedButton(
              onPressed: () {
                toggleSize();
              },
              child: const Text("OK")),
        ],
      ),
    );
  }
}
