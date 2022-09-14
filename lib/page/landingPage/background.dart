import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: -136,
            left: -169,
            child: Image(
              image: AssetImage("assets/images/background_circle.png"),
              fit: BoxFit.cover,
              width: 300,
            ),
          ),
          Positioned(
            bottom: -250,
            left: -120,
            child: Image(
              image: AssetImage("assets/images/background_circle.png"),
              fit: BoxFit.cover,
              width: 300,
            ),
          ),
          Positioned(
            top: 271,
            right: -100,
            child: Image(
              image: AssetImage("assets/images/background_circle.png"),
              fit: BoxFit.cover,
              width: 140,
            ),
          ),
          child
        ],
      ),
    );
  }
}
