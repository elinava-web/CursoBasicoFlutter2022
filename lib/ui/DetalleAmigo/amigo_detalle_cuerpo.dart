import 'package:flutter/material.dart';
import 'package:nava/ui/Amigos/cls_amigo.dart';

class FriendDetailBody extends StatelessWidget {
  FriendDetailBody(this.friend);
  final Amigo friend;

  Widget _buildLocationInfo(TextTheme textTheme) {
    return new Row(
      children: <Widget>[
        new Icon(
          Icons.place,
          color: Colors.white,
          size: 16.0,
        ),
        new Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: new Text(
            friend.location,
            //style: textTheme.subhead.copyWith(color: Colors.white),
            style: textTheme.subtitle1!.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _createCircleBadge(IconData iconData, Color color) {
    return new Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: new CircleAvatar(
        backgroundColor: color,
        child: new Icon(
          iconData,
          color: Colors.white,
          size: 16.0,
        ),
        radius: 16.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;

    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Text(
          friend.name,
          //style: textTheme.headline.copyWith(color: Colors.white),
          style: textTheme.headline5!.copyWith(color: Colors.white),
        ),
        new Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: _buildLocationInfo(textTheme),
        ),
        new Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: new Text(
            //'Lorem Ipsum is simply dummy text of the printing and typesetting '
            'Conocimientos de Aplicaciones Moviles en Android e IOS '
            //'industry. Lorem Ipsum has been the industry\'s standard dummy '
            'Programacion Utilizando Framework en Flutter\'s Google Master '
            'Flutter OnLine https://flutlab.io/ .',
            style:
                //textTheme.body1.copyWith(color: Colors.white70, fontSize: 16.0),
                textTheme.bodyText2!.copyWith(color: Colors.white70, fontSize: 16.0),
          ),
        ),
        new Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: new Row(
            children: <Widget>[
              _createCircleBadge(Icons.beach_access, theme.accentColor),
              _createCircleBadge(Icons.cloud, Colors.white12),
              _createCircleBadge(Icons.shop, Colors.white12),
            ],
          ),
        ),
      ],
    );
  }
}
