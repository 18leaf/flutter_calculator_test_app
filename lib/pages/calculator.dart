import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  String _display = "0.0";
  double _last = 0.0;
  bool _mult = false;
  bool _div = false;
  bool _mod = false;
  bool _sub = false;
  bool _add = false;

  // set display to last, clear display unless + - / x then display last
  void _appendDisplay(String next) {
    // stop from 0.0 conv to none
    if (_display == "0.0" && (next != "=" && next != "+" && next != "-" && next != "%" && next != "x" && next != "÷")) {
      _display = "";
    }
    switch (next) {
      case "+":
        _add = true;
        break;
      case "-":
        _sub = true;
        break;
      case "%":
        _mod = true;
        break;
      case "÷":
        _div = true;
        break;
      case "x":
        _mult = true;
        break;
      case "=":
        return _equals();
        break;
      default:
        return setState(() {
          _display += next;
        });
    }
    setState(() {
      _last += double.parse(_display);
      _display = "0.0";
    });
  }

  // check operation type, execute, set State Of Display after equal.
  void _equals() {
    double temp = _doubleFromDisplay(_display);

    if (_mult) {
      _display = (_last * temp).toString();
      _mult = false;
    } else if (_add) {
      _display = (_last + temp).toString();
      _add = false;
    } else if (_sub) {
      _display = (_last - temp).toString();
      _sub = false;
    } else if (_div) {
      // Add a check for division by zero
      if (temp != 0.0) {
        _display = (_last / temp).toString();
      } else {
        _display = "Error"; // Or handle the error as you see fit
      }
      _div = false;
    } else if (_mod) {
      _display = (_last % temp).toString();
      _mod = false;
    }

    setState(() {
      _last = 0.0; // Reset _last to 0.0 after operation
      _display;
    });
  }

  void _clearDisplay() {
    setState(() {
      _display = "0.0";
      _last = 0.0;
      _mult = false;
      _div = false;
      _mod = false;
      _sub = false;
      _add = false;
    });
  }

  void _setLast(double num) {
    _last = num;
  }

  double _doubleFromDisplay(String display) {
    return double.parse(display);
  }

  final List _calcButtons = ['7', '8', '9', "-", "4", "5", "6", "x", "1", "2", "3", "÷"];

  Color _getColor(int index) {
    switch (index) {
      case 3:
      case 7:
      case 11:
        return Colors.lightBlue;
      default:
        return Colors.black87;
    }
  }

  void _printNumber(int index) {
    print(_calcButtons[index]);
  }

  String _getText() {
    return "0.0";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.darkBackgroundGray,
      body: Center(
        child: Column(
          children: [
            //screen
            Expanded(
              child: Stack(
                children: [
                  Container(
                    height: 164,
                    color: CupertinoColors.black,
                  ),
                  Center(
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Container(
                          color: Colors.green[900],
                          height: 116,
                          margin: EdgeInsets.only(left: 10, right: 10),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 20),
                          child: Text(
                            _display,
                            style: TextStyle(
                              fontSize: 52,
                              fontWeight: FontWeight.w800
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ]
              ),
            ),

            // three button
            Expanded(
              flex: 3,
              child: Center(
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 11,
                              child: GestureDetector(
                                onTap: () {
                                  _clearDisplay();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "C L E A R",
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                        color: CupertinoColors.white,
                                      ),
                                    )
                                  ),
                                  margin: EdgeInsets.all(10),
                                ),
                              )
                          ),
                          Expanded(
                            flex: 7,
                              child: GestureDetector(
                                onTap: () {
                                  _appendDisplay("%");
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Center(
                                      child: Text(
                                        "%",
                                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: CupertinoColors.white)
                                      )
                                  ),
                                  margin: EdgeInsets.only(top: 10, bottom: 10),
                                ),
                              )
                          ),
                          Expanded(
                            flex: 11,
                              child: GestureDetector(
                                onTap: () {
                                  _appendDisplay("+");
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.lightBlue,
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Center(
                                      child: Text(
                                        "+",
                                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: CupertinoColors.white)
                                      )
                                  ),
                                  margin: EdgeInsets.all(10),
                                ),
                              )
                          ),
                        ],
                      ),
                    ),
                    //12 button
                    Expanded(
                      flex: 3,
                      child: GridView.builder(
                        itemCount: 12,
                        padding: EdgeInsets.only(left: 5, right: 5),
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            _appendDisplay(_calcButtons[index]);
                          },
                          child: Container(
                            child: Center(child: Text(_calcButtons[index], style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: CupertinoColors.white),)),
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: _getColor(index),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                          ),
                        ),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                      )
                    ),

                    // three button
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                              flex: 11,
                                child: GestureDetector(
                                  onTap: () {
                                    _appendDisplay("0");
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black87,
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Center(
                                        child: Text(
                                          "0",
                                          style: TextStyle(
                                            fontSize: 32,
                                            fontWeight: FontWeight.w900,
                                            color: CupertinoColors.white,
                                          ),
                                        )
                                    ),
                                    margin: EdgeInsets.all(10),
                                  ),
                                )
                          ),
                          Expanded(
                              flex: 7,
                              child: GestureDetector(
                                onTap: () {
                                  _appendDisplay(".");
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Center(
                                      child: Text(
                                          ".",
                                          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: CupertinoColors.white)
                                      )
                                  ),
                                  margin: EdgeInsets.only(top: 10, bottom: 10),
                                ),
                              )
                          ),
                          Expanded(
                              flex: 11,
                              child: GestureDetector(
                                onTap: () {
                                  _appendDisplay("=");
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.lightBlue,
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Center(
                                      child: Text(
                                          "=",
                                          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: CupertinoColors.white)
                                      )
                                  ),
                                  margin: EdgeInsets.all(10),
                                ),
                              )
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            )

          ],
        )
      ),
    );
  }
}
