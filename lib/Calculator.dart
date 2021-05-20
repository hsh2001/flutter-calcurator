import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'Result.dart';
import 'NumberButton.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _result = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 600),
          child: Column(
            children: <Widget>[
              Result(result: _result),
              Container(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: NumberButton(
                            displayNumber: 'AC',
                            onTap: () {
                              setState(() {
                                _result = '0';
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: NumberButton(
                            displayNumber: '+/-',
                            onTap: () {
                              setState(() {
                                _result = '${-int.parse(_result)}';
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: NumberButton(
                            displayNumber: '%',
                            onTap: () {
                              setState(() {
                                try {
                                  double resultInt = double.parse(_result);

                                  if (resultInt == 0) {
                                    return;
                                  }

                                  _result = '${resultInt / 100}';
                                } catch (e) {}
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: NumberButton(
                            displayNumber: '÷',
                            onTap: () {
                              _typeResult('÷');
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: NumberButton(
                            displayNumber: '1',
                            onTap: () {
                              _typeResult('1');
                            },
                          ),
                        ),
                        Expanded(
                          child: NumberButton(
                            displayNumber: '2',
                            onTap: () {
                              _typeResult('2');
                            },
                          ),
                        ),
                        Expanded(
                          child: NumberButton(
                            displayNumber: '3',
                            onTap: () {
                              _typeResult('3');
                            },
                          ),
                        ),
                        Expanded(
                          child: NumberButton(
                            displayNumber: '×',
                            onTap: () {
                              _typeResult('×');
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: NumberButton(
                            displayNumber: '4',
                            onTap: () {
                              _typeResult('4');
                            },
                          ),
                        ),
                        Expanded(
                          child: NumberButton(
                            displayNumber: '5',
                            onTap: () {
                              _typeResult('5');
                            },
                          ),
                        ),
                        Expanded(
                          child: NumberButton(
                            displayNumber: '6',
                            onTap: () {
                              _typeResult('6');
                            },
                          ),
                        ),
                        Expanded(
                          child: NumberButton(
                            displayNumber: '-',
                            onTap: () {
                              _typeResult('-');
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: NumberButton(
                            displayNumber: '7',
                            onTap: () {
                              _typeResult('7');
                            },
                          ),
                        ),
                        Expanded(
                          child: NumberButton(
                            displayNumber: '8',
                            onTap: () {
                              _typeResult('8');
                            },
                          ),
                        ),
                        Expanded(
                          child: NumberButton(
                            displayNumber: '9',
                            onTap: () {
                              _typeResult('9');
                            },
                          ),
                        ),
                        Expanded(
                          child: NumberButton(
                            displayNumber: '+',
                            onTap: () {
                              _typeResult('+');
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: NumberButton(
                            displayNumber: '0',
                            onTap: () {
                              _typeResult('0');
                            },
                          ),
                        ),
                        Expanded(
                          child: NumberButton(
                            displayNumber: '.',
                            onTap: () {
                              _typeResult('.');
                            },
                          ),
                        ),
                        Expanded(
                          child: NumberButton(
                            displayNumber: '=',
                            onTap: () {
                              _calculateResult();
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _typeResult(String text) {
    setState(() {
      if (_result == '0') {
        _result = text;
      } else {
        _result = _result + text;
      }
    });
  }

  _calculateResult() {
    setState(() {
      String resultForRun = _result.replaceAll('×', '*').replaceAll('÷', '/');
      final parser = new Parser();

      _result = parser
          .parse(resultForRun)
          .evaluate(EvaluationType.REAL, null)
          .toString()
          .replaceFirst(RegExp("(\\.0)\$"), '');
    });
  }
}
