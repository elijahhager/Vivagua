library counter;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../Components/LogDiveButton.dart';

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
    final ThemeData themeData = Theme.of(context);
    color = color ?? themeData.accentColor;
    textStyle = textStyle ?? new TextStyle(
      fontSize: 65.0,
    );

    return new Container(
      padding: new EdgeInsets.all(4.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          new KOutlineButton(
            radius: 200.0,
            borderColor: Colors.blue,
            text: '-',
            textColor: Colors.blue,
            textFontWeight: FontWeight.bold,
            onPressed: () {
              if (selectedValue - step >= minValue) {
                onChanged((selectedValue - step));
              }
            }
          ),
          new Container(
            padding: EdgeInsets.all(36.0),
            child: new Text(
                '${num.parse((selectedValue).toStringAsFixed(decimalPlaces))}',
                style: TextStyle(fontSize: 36, color: Color(0xff2298f2)),
            ),
          ),
          new KOutlineButton(
            radius: 200.0,
            borderColor: Colors.blue,
            text: '+',
            textColor: Colors.blue,
            textFontWeight: FontWeight.bold,
            onPressed: () {
              if (selectedValue + step <= maxValue) {
                onChanged((selectedValue + step));
              }
            }
          ),
        ],
      ),
    );
  }
}