import 'dart:io';

import 'package:chat/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _textController = new TextEditingController();
  final _focusNode = new FocusNode();
  /*
  List<ChatMessage> _message = [
    ChatMessage(texto: 'Hola Mundo', uid: '123'),
    ChatMessage(texto: 'Hola Hermano', uid: 'a123'),
    ChatMessage(
        texto:
            'Hola Mundo, esto es una prueba de mensaje muy largo para ver como se miran dichos mensajes, prueba 1',
        uid: '123'),
    ChatMessage(
        texto:
            'Hola Hermano, , esto es una prueba de mensaje muy largo para ver como se miran dichos mensajes, prueba 1',
        uid: 'a123'),
    ChatMessage(texto: 'Hola Mundo1', uid: '123'),
    ChatMessage(texto: 'Hola Mundo2', uid: '123'),
    ChatMessage(texto: 'Hola Mundo3', uid: '123'),
    ChatMessage(texto: 'Hola Hermano1', uid: 'a123'),
    ChatMessage(texto: 'Hola Hermano2', uid: 'a123'),
    ChatMessage(texto: 'Hola Hermano3', uid: 'a123'),
  ];
  */
  List<ChatMessage> _message = [];
  bool _estaEscribiendo = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Column(
            children: [
              CircleAvatar(
                child: Text(
                  'Wi',
                  style: TextStyle(fontSize: 12),
                ),
                backgroundColor: Colors.yellow,
                maxRadius: 12,
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                'Wilma Gonzalez',
                style: TextStyle(
                    fontSize: 12, backgroundColor: Colors.greenAccent),
              )
            ],
          ),
          centerTitle: true,
          elevation: 1,
        ),
        body: Container(
          child: Column(
            children: [
              Flexible(
                  child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _message.length,
                itemBuilder: (_, i) => _message[i],
                reverse: true,
              )),
              Divider(
                height: 3,
              ),
              Container(
                color: Colors.cyan,
                height: 100,
                child: _inputChat(),
              ),
            ],
          ),
        ));
  }

  Widget _inputChat() {
    return SafeArea(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmit,
              onChanged: (String text) {
                setState(() {
                  if (text.trim().length > 0) {
                    _estaEscribiendo = true;
                  } else {
                    _estaEscribiendo = false;
                  }
                  //print('_estaEscribiendo ' + _estaEscribiendo.toString());
                });
              },
              decoration: InputDecoration.collapsed(hintText: 'Enviar mensaje'),
              focusNode: _focusNode,
            ),
          ),
          //boton de enviar
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            child: Platform.isIOS
                ? CupertinoButton(
                    child: Text('Enviar'),
                    onPressed: _estaEscribiendo
                        ? () => _handleSubmit(_textController.text.trim())
                        : null,
                  )
                : Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    child: IconTheme(
                      data: IconThemeData(color: Colors.blue[400]),
                      child: IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        icon: Icon(Icons.send),
                        onPressed: _estaEscribiendo
                            ? () => _handleSubmit(_textController.text.trim())
                            : null,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    ));
  }

  _handleSubmit(String texto) {
    if (texto.length == 0) return;
    final newMessage = new ChatMessage(
      texto: texto,
      uid: '123',
      animationController: AnimationController(
          vsync: this, duration: Duration(milliseconds: 800)),
    );
    _message.insert(0, newMessage);
    newMessage.animationController.forward();
    if (texto == null) {
      print('no hay datos....');
    } else {
      print(texto);
    }

    _textController.clear();
    _focusNode.requestFocus();

    setState(() {
      _estaEscribiendo = false;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //off el socket

    //limpiar las instancias de los mensajes
    for (ChatMessage message in _message) {
      message.animationController.dispose();
    }
    super.dispose();
  }
}
