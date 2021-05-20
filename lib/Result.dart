import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  final String result;

  Result({Key key, this.result}) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(50),
      margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
      child: Text(
        widget.result,
        textAlign: TextAlign.right,
        style: Theme.of(context).textTheme.headline3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
