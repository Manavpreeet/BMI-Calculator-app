import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {



  Function onTap;
  String name;

  @override
  Widget build(BuildContext context) {
    return           GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(name,
                  style: TextStyle(
                    fontSize: 36.0,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10,20, 0),
                child: Divider(
                  height: 1,
                  thickness: 3,
                  color: Color(0xFF1D1E33),
                ),
              )
            ],
          ),
        ),
        color: Color(0xFFEB1555),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomCardSize,
      ),
    );
  }

  BottomButton({this.name, this.onTap});
}
