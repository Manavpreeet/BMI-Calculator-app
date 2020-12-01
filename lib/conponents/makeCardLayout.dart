import 'package:flutter/material.dart';



class makeCardLayout extends StatelessWidget {



  makeCardLayout({@required this.colour,  this.child, this.onPress});

  final Widget child;
  final Color colour;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPress,
      child: Container(
          child: child,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10),
          ),
      ),
    );
  }
}
