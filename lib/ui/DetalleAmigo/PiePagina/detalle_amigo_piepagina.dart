import 'package:flutter/material.dart';
import 'package:nava/ui/DetalleAmigo/PiePagina/ver_articulos.dart';
import 'package:nava/ui/DetalleAmigo/PiePagina/mostrar_portafolio.dart';
import 'package:nava/ui/DetalleAmigo/PiePagina/ver_habilidades.dart';
import 'package:nava/ui/Amigos/cls_amigo.dart';

class FriendShowcase extends StatefulWidget {
  FriendShowcase(this.friend);

  final Amigo friend;

  @override
  _FriendShowcaseState createState() => new _FriendShowcaseState();
}

class _FriendShowcaseState extends State<FriendShowcase> with TickerProviderStateMixin {
  late List<Tab> _tabs;
  late List<Widget> _pages;
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _tabs = [
      new Tab(text: 'Portafolio'),
      new Tab(text: 'Habilidades'),
      new Tab(text: 'Articulos'),
    ];
    _pages = [
      new PortfolioShowcase(),
      new SkillsShowcase(),
      new ArticlesShowcase(),
    ];
    _controller = new TabController(
      length: _tabs.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(16.0),
      child: new Column(
        children: <Widget>[
          new TabBar(
            controller: _controller,
            tabs: _tabs,
            indicatorColor: Colors.white,
          ),
          new SizedBox.fromSize(
            size: const Size.fromHeight(300.0),
            child: new TabBarView(
              controller: _controller,
              children: _pages,
            ),
          ),
        ],
      ),
    );
  }
}
