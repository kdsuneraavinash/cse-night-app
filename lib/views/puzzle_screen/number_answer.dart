import 'package:cse_night/views/widgets/backdrop.dart';
import 'package:cse_night/views/widgets/number_slider.dart';
import 'package:flutter/material.dart';

class NumberAnswerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter the Numbers"),
      ),
      body: BackDropWidget(
        animating: true,
        overlayOpacity: 200,
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            SizedBox(height: 30),
            NumberSlider(
              color: Colors.red,
              offset: 5,
            ),
            NumberSlider(
              color: Colors.blue,
              offset: 2,
            ),
            NumberSlider(
              color: Colors.amber,
              offset: 4,
            ),
            NumberSlider(
              color: Colors.green,
              offset: 8,
            ),
            NumberSlider(
              color: Colors.orange,
              offset: 12,
            ),
            NumberSlider(
              color: Colors.teal,
              offset: 22,
            ),
            NumberSlider(
              color: Colors.pink,
              offset: 6,
            ),
            NumberSlider(
              color: Colors.deepOrange,
              offset: 7,
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.pop(context);
      //   },
      //   child: Icon(MdiIcons.arrowLeft),
      // ),
    );
  }
}
