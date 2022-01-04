import 'package:flutter/material.dart';
import 'package:nava/ui/DetalleAmigo/PiePagina/detalle_amigo_piepagina.dart';
import 'package:nava/ui/DetalleAmigo/amigo_detalle_cuerpo.dart';
import 'package:nava/ui/DetalleAmigo/Encabezado/encabezado_detalle_amigo.dart';
import 'package:nava/ui/Amigos/cls_amigo.dart';

class FriendDetailsPage extends StatefulWidget {
  FriendDetailsPage(
    this.friend, {
    //@required this.avatarTag,
    required this.avatarTag,
  });

  final Amigo friend;
  final Object avatarTag;

  @override
  _FriendDetailsPageState createState() => new _FriendDetailsPageState();
}

class _FriendDetailsPageState extends State<FriendDetailsPage> {
  @override
  Widget build(BuildContext context) {
    var linearGradient = const BoxDecoration(
      gradient: const LinearGradient(
        begin: FractionalOffset.centerRight,
        end: FractionalOffset.bottomLeft,
        colors: <Color>[
          const Color(0xFF413070),
          const Color(0xFF2B264A),
        ],
      ),
    );

    return new Scaffold(
      body: new SingleChildScrollView(
        child: new Container(
          decoration: linearGradient,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new EncabezadoDetalleAmigo(
                widget.friend,
                avatarTag: widget.avatarTag,
              ),
              new Padding(
                padding: const EdgeInsets.all(24.0),
                child: new FriendDetailBody(widget.friend),
              ),
              new FriendShowcase(widget.friend),
            ],
          ),
        ),
      ),
    );
  }
}
