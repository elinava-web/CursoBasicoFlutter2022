import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nava/ui/DetalleAmigo/pagina_detalles_amigo.dart';
import 'package:nava/ui/Amigos/cls_amigo.dart';

class PaginaListaAmigos extends StatefulWidget {
  @override
  _PaginaListaAmigosState createState() => new _PaginaListaAmigosState();
}

class _PaginaListaAmigosState extends State<PaginaListaAmigos> {
  List<Amigo> _amigos = [];

  @override
  void initState() {
    super.initState();
    _loadFriends();
  }

  Future<void> _loadFriends() async {
    http.Response response = await http.get(Uri.parse('https://randomuser.me/api/?results=25'));

    setState(() {
      _amigos = Amigo.allFromResponse(response.body);
    });
  }

  Widget _buildFriendListTile(BuildContext context, int index) {
    var friend = _amigos[index];

    return new ListTile(
      onTap: () => _navigateToFriendDetails(friend, index),
      leading: new Hero(
        tag: index,
        child: new CircleAvatar(
          backgroundImage: new NetworkImage(friend.avatar),
        ),
      ),
      title: new Text(friend.name),
      subtitle: new Text(friend.email),
    );
  }

  void _navigateToFriendDetails(Amigo friend, Object avatarTag) {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (c) {
          return new FriendDetailsPage(friend, avatarTag: avatarTag);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (_amigos.isEmpty) {
      content = new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      content = new ListView.builder(
        itemCount: _amigos.length,
        itemBuilder: _buildFriendListTile,
      );
    }

    return new Scaffold(
      appBar: new AppBar(title: new Text('Amigos')),
      body: content,
    );
  }
}
