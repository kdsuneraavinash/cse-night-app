import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumberSlider extends StatefulWidget {
  final Color color;
  final int offset;
  final String characters = " ABCDEFGHIJKLMNOPQRSTUVWXYZ";

  const NumberSlider({Key key, this.color = Colors.amber, this.offset = 0})
      : super(key: key);

  @override
  _NumberSliderState createState() => _NumberSliderState();
}

class _NumberSliderState extends State<NumberSlider> {
  double _value;

  @override
  void initState() {
    _value = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: CupertinoSlider(
              value: _value,

              // inactiveColor: widget.color.withAlpha(100),
              // label: "${_value.toInt()}",
              divisions: 50,
              activeColor: widget.color,
              onChanged: (double newValue) {
                setState(() {
                  _value = newValue;
                });
              },
              min: 0.0,
              max: 30.0,
            ),
          ),
          Container(
            width: 64,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${widget.characters[(_value.toInt() + widget.offset) % 27]}"
              " [${_value.toInt()}]",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: widget.color,
              ),
            ),
          )
        ],
      ),
    );
  }
}
