import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String titulo;

  const Logo({Key key, @required this.titulo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 2),
        width: 170,
        child: Column(
          children: <Widget>[
            Image(image: AssetImage('assets/tag-logo.png')),
            SizedBox(
              height: 2,
            ),
            Text(
              this.titulo,
              style: TextStyle(fontSize: 13),
            )
          ],
        ),
      ),
    );
  }
}
