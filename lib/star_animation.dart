import 'package:flutter/material.dart';

class ContainerAnimation extends StatefulWidget {
  const ContainerAnimation({super.key});

  @override
  State<ContainerAnimation> createState() => _ContainerAnimationState();
}

class _ContainerAnimationState extends State<ContainerAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );

    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: AnimatedBuilder(
              animation: _progressAnimation,
              builder: (context, child) {
                return Container(
                  width: 600,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        width: 600 * _progressAnimation.value,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: AnimatedBuilder(
              animation: animationController,
              builder: (context, child) => Text(
                "${(_progressAnimation.value * 100).toInt()} %",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          BouncingRotatingStar(),
        ],
      ),
    );
  }
}

class BouncingRotatingBall extends StatefulWidget {
  const BouncingRotatingBall({super.key});

  @override
  State<BouncingRotatingBall> createState() => _BouncingRotatingBallState();
}

class _BouncingRotatingBallState extends State<BouncingRotatingBall>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bounceAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);

    _bounceAnimation = Tween<double>(begin: -100, end: 100).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _rotationAnimation = Tween<double>(begin: 0, end: 2 * 3.14).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..translate(0, _bounceAnimation.value)
            ..rotateX(_rotationAnimation.value)
            ..rotateY(_rotationAnimation.value),
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.5),
                  blurRadius: 20,
                  spreadRadius: 5,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class BouncingRotatingStar extends StatefulWidget {
  const BouncingRotatingStar({super.key});

  @override
  State<BouncingRotatingStar> createState() => _BouncingRotatingStarState();
}

class _BouncingRotatingStarState extends State<BouncingRotatingStar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _horizontalAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4), // Sekinroq harakat
    )..repeat(reverse: true);

    _horizontalAnimation = Tween<double>(begin: -150, end: 150).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _rotationAnimation = Tween<double>(begin: 0, end: 2 * 3.14).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..translate(_horizontalAnimation.value, 0) // Gorizontal harakat
            ..rotateZ(_rotationAnimation.value), // O‘z o‘qi atrofida aylanish
          child: Icon(
            Icons.star,
            size: 100,
            color: Colors.amberAccent,
            shadows: [
              Shadow(
                color: Colors.amber.withOpacity(0.5),
                blurRadius: 20,
              ),
            ],
          ),
        );
      },
    );
  }
}
