import 'package:chat/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UsuariosPage extends StatefulWidget {
  @override
  _UsuariosPageState createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final usuarios = [
    Usuario(
        uid: '1',
        nombre: 'Wilma',
        email: 'miguel_moreno20@hotmail.com',
        online: true),
    Usuario(
        uid: '2',
        nombre: 'Miguel',
        email: 'miguel_moreno10@hotmail.com',
        online: false),
    Usuario(
        uid: '3',
        nombre: 'Ale',
        email: 'miguel_moreno30@hotmail.com',
        online: true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mi Nombre',
          style: TextStyle(color: Colors.grey),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.exit_to_app,
            color: Colors.amber,
          ),
          onPressed: () {},
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            /*
              child: Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
              */
            child: Icon(
              Icons.offline_bolt,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: SmartRefresher(
          enablePullDown: true,
          header: WaterDropHeader(
            complete: Icon(Icons.check_box, color: Colors.orange),
            waterDropColor: Colors.pink,
          ),
          controller: _refreshController,
          onRefresh: _cargarUsuarios,
          child: _listViewUsuarios()),
    );
  }

  ListView _listViewUsuarios() {
    return ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (_, i) => _usuarioListTile(usuarios[i]),
        separatorBuilder: (_, i) => Divider(),
        itemCount: usuarios.length);
  }

  ListTile _usuarioListTile(Usuario usuario) {
    return ListTile(
      title: Text(usuario.nombre),
      subtitle: Text(usuario.email),
      leading: CircleAvatar(
        child: Text(usuario.nombre.substring(0, 2)),
        backgroundColor: Colors.blue[100],
      ),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: usuario.online ? Colors.green : Colors.red,
            borderRadius: BorderRadius.circular(100)),
      ),
    );
  }

  _cargarUsuarios() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }
}
