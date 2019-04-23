import 'package:flutter/material.dart';

class SickSlider extends StatefulWidget {
  final double height, width, max, min, val;
  final int divisions;
  final Color activeColor, inactiveColor;
  const SickSlider({Key key, this.height, this.width, this.max, this.min, this.val, this.divisions, this.activeColor, this.inactiveColor})
      : super(key: key);
  @override
  _SickSliderState createState() => new _SickSliderState(
        height: height,
        width: width,
        max: max,
        min: min,
        val: val,
        divisions: divisions,
        activeColor: activeColor,
        inactiveColor: inactiveColor,
      );
}

class _SickSliderState extends State<SickSlider> {
  double height, width, max, min;
  double val;
  int divisions;
  Color activeColor, inactiveColor;
  _SickSliderState({
    this.height,
    this.width,
    this.max,
    this.min,
    this.val,
    this.divisions,
    this.activeColor,
    this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
        height: this.height,
        width: this.width,
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 24),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "small",
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  "Size",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  "large",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            Slider(
              value: this.val,
              onChanged: (double e) => this.changed(e),
              activeColor: this.activeColor,
              inactiveColor: this.inactiveColor,
              divisions: this.divisions,
              max: this.max,
              min: this.min,
            ),
          ],
        ));
  }

  void changed(e) {
    setState(() {
      val = e;
    });
  }
}
