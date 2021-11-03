import 'package:chat/widgets/boton_azul.dart';
import 'package:chat/widgets/custom_input.dart';
import 'package:chat/widgets/labels.dart';
import 'package:chat/widgets/logo.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * .9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Logo(titulo: 'Registro'),
                  _Form(),
                  Labels(
                      label1: 'Ya tienes una cuenta?',
                      label2: 'Ingresa con tu cuenta',
                      ruta: 'login'),
                  Labels1(),
                ],
              ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final nombreCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(children: <Widget>[
        CustomInput(
          iconData: Icons.perm_identity,
          placeHolder: 'Nombre',
          textController: nombreCtrl,
          textInputType: TextInputType.text,
          isPassword: false,
        ),
        CustomInput(
          iconData: Icons.mail_outline,
          placeHolder: 'Correo electrónico',
          textController: emailCtrl,
          textInputType: TextInputType.emailAddress,
          isPassword: false,
        ),
        CustomInput(
          iconData: Icons.palette,
          placeHolder: 'Contraseña',
          textController: passCtrl,
          textInputType: TextInputType.text,
          isPassword: true,
        ),
        BotonAzul(
            text: 'Guardar datos',
            onPressed: () {
              print(nombreCtrl.text);
            })
      ]),
    );
  }
}
