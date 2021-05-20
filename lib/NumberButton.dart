import 'package:flutter/material.dart';

class NumberButton extends StatefulWidget {
  final void Function() onTap;
  final String displayNumber;

  NumberButton({Key key, this.onTap, this.displayNumber}) : super(key: key);

  @override
  _NumberButtonState createState() => _NumberButtonState();
}

class _NumberButtonState extends State<NumberButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(1000),
        ),
        child: Center(
          child: Text(
            '${widget.displayNumber}',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
