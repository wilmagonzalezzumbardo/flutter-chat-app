import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final IconData iconData;
  final String placeHolder;
  final TextEditingController textController;
  final TextInputType textInputType;
  final bool isPassword;

  const CustomInput(
      {Key key,
      @required this.iconData,
      @required this.placeHolder,
      @required this.textController,
      this.textInputType = TextInputType.text,
      this.isPassword = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 6, left: 5, bottom: 6, right: 20),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(.05),
              blurRadius: 5,
            ),
          ],
        ),
        child: TextField(
          controller: this.textController,
          autocorrect: false,
          keyboardType: this.textInputType,
          obscureText: this.isPassword,
          decoration: InputDecoration(
            prefixIcon: Icon(this.iconData),
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: this.placeHolder,
          ),
        ));
  }
}
