import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String label1;
  final String label2;
  final String ruta;
  const Labels(
      {Key key,
      @required this.label1,
      @required this.label2,
      @required this.ruta})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: <Widget>[
          Text(
            this.label1,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 10,
                fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 15,
          ),
          GestureDetector(
            child: Text(
              this.label2,
              style: TextStyle(
                  color: Colors.blue[600],
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, this.ruta);
            },
          ),
        ],
      ),
    );
  }
}

class Labels1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: <Widget>[
          Text(
            'Términos y condiciones de uso',
            style: TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
