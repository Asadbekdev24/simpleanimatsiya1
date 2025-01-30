import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Size> _sizeAnimation;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 15));

    _sizeAnimation = Tween<Size>(begin: Size(20, 10), end: Size(600, 10))
        .animate(
            CurvedAnimation(parent: animationController, curve: Curves.linear));

    animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _sizeAnimation,
            builder: (context, child) {
              return Container(
                height: _sizeAnimation.value.height,
                width: _sizeAnimation.value.width,
                decoration: ShapeDecoration(
                    color: Colors.amberAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.zero))),
              );
            },
            child: Container(
              height: 10,
              width: 100,
              decoration: ShapeDecoration(
                color: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
