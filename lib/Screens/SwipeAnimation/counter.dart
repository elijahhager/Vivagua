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
          new Container(
              height: 122.0,
              width: 175.0,
              alignment: Alignment.center,
              decoration: new BoxDecoration(
                color: Colors.white, //Color.fromRGBO(10, 235, 10, 0.85),
                borderRadius: new BorderRadius.circular(20.0),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.red[200],
                    blurRadius: 2,
                    offset: new Offset(0, 1.0),
                  )
                ],
              ),
              child: SizedBox.expand(
                child: new FlatButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0)),
                  highlightColor: Colors.red[50],
                  padding: new EdgeInsets.all(0.0),
                  onPressed: () {
                    if (selectedValue - step >= minValue) {
                      onChanged(selectedValue - step);
                    }
                  },
                  child: new Icon(Icons.exposure_neg_1, color: Colors.red, size: 48),
                ),
              )),
          new Container(
            padding: EdgeInsets.all(66.0),
            child: new Text(
              '${num.parse((selectedValue).toStringAsFixed(decimalPlaces))}',
              style: TextStyle(
                  fontSize: 56,
                  color: Color(0xff2298f2),
                  fontWeight: FontWeight.w300),
            ),
          ),
          new Container(
              height: 122.0,
              width: 175.0,
              alignment: Alignment.center,
              decoration: new BoxDecoration(
                color: Colors.white, //Color.fromRGBO(10, 235, 10, 0.85),
                borderRadius: new BorderRadius.circular(20.0),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.green[200],
                    blurRadius: 2,
                    offset: new Offset(0, 1.0),
                  )
                ],
              ),
              child: SizedBox.expand(
                child: new FlatButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0)),
                  highlightColor: Colors.green[50],
                  padding: new EdgeInsets.all(0.0),
                  onPressed: () {
                    if (selectedValue + step <= maxValue) {
                      onChanged((selectedValue + step));
                    }
                  },
                  child: new Icon(Icons.exposure_plus_1, color: Colors.green, size: 48),
                ),
              )),
        ],
      ),
    );
  }
}
