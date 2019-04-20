import 'package:flutter/material.dart';

class UnrealButton extends StatelessWidget {
  final double height, width, borderRadius;
  final Color color, highlightColor, shadowColor, backgroundColor;
  final Widget content;
  final Function onPressed;

  UnrealButton({
      this.height = 60.0,
      this.width = 100.0,
      this.color,
      this.highlightColor = Colors.white,
      this.shadowColor = Colors.white,
      this.backgroundColor = Colors.white,
      @required this.content,
      this.borderRadius,
      this.onPressed,
    });

  @override
  Widget build(BuildContext context) {
    return new Container(
        height: this.height,
        width: this.width,
        alignment: Alignment.center,
        decoration: new BoxDecoration(
          color: this.backgroundColor,
          borderRadius: new BorderRadius.circular(this.borderRadius),
          boxShadow: [
            new BoxShadow(
              color: this.shadowColor,
              blurRadius: 2,
              offset: new Offset(0, 1.0),
            )
          ],
        ),
        child: SizedBox.expand(
          child: new FlatButton(
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(this.borderRadius)),
            highlightColor: this.highlightColor,
            onPressed: this.onPressed,
            child: this.content,
          ),
        ));
  }
}
