library counter;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../Components/LogDiveButton.dart';
import 'package:vivagua/Components/UnrealButton.dart';

typedef void CounterChangeCallback(num value);

class Counter extends StatelessWidget {
  final CounterChangeCallback onChanged;

  Counter({
    Key key,
    @required num initialValue,
    @required this.minValue,
    @required this.maxValue,
    @required this.onChanged,
    @required this.decimalPlaces,
    this.color,
    this.textStyle,
    this.step = 1,
    this.buttonSize = 75,
  })  : assert(initialValue != null),
        assert(minValue != null),
        assert(maxValue != null),
        assert(maxValue > minValue),
        assert(initialValue >= minValue && initialValue <= maxValue),
        assert(step > 0),
        selectedValue = initialValue,
        super(key: key);

  ///min value user can pick
  final num minValue;

  ///max value user can pick
  final num maxValue;

  /// decimal places required by the counter
  final int decimalPlaces;

  ///Currently selected integer value
  num selectedValue;

  /// if min=0, max=5, step=3, then items will be 0 and 3.
  final num step;

  /// indicates the color of fab used for increment and decrement
  Color color;

  /// text syle
  TextStyle textStyle;

  final double buttonSize;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    color = color ?? themeData.accentColor;
    textStyle = textStyle ??
        new TextStyle(
          fontSize: 65.0,
        );

    return new Container(
      padding: new EdgeInsets.all(4.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          new UnrealButton(
              height: screenSize.height * 0.1,
              width: screenSize.width * 0.25,
              highlightColor: Colors.red[50],
              shadowColor: Colors.red[200],
              backgroundColor: Colors.white,
              content: Icon(Icons.exposure_neg_1,
                  color: Colors.red, size: screenSize.width * 0.07),
              borderRadius: 20.0,
              onPressed: () {
                if (selectedValue - step >= minValue) {
                  onChanged(selectedValue - step);
                }
              }),
          new Padding(
            padding: EdgeInsets.all(26.0),
            child: new UnrealButton(
              height: screenSize.height * 0.1,
              width: screenSize.width * 0.15,
              highlightColor: Colors.black12,
              shadowColor: Colors.white,
              backgroundColor: Colors.white,
              content:  Text('${num.parse((selectedValue).toStringAsFixed(decimalPlaces))}', style: TextStyle(color: Colors.blue, fontSize: 30.0),),
              borderRadius: 100.0,
              onPressed: () {
                if (selectedValue + step <= maxValue) {
                  onChanged((selectedValue + step));
                }
              }),
          ),
          
          new UnrealButton(
              height: screenSize.height * 0.1,
              width: screenSize.width * 0.25,
              highlightColor: Colors.green[50],
              shadowColor: Colors.green[200],
              backgroundColor: Colors.white,
              content: Icon(Icons.exposure_plus_1,
                  color: Colors.green, size: screenSize.width * 0.07),
              borderRadius: 20.0,
              onPressed: () {
                if (selectedValue + step <= maxValue) {
                  onChanged((selectedValue + step));
                }
              }),
        ],
      ),
    );
  }
}
