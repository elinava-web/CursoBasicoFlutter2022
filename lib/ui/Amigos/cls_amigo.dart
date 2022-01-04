import 'dart:convert';

class Amigo {
  Amigo({
    required this.avatar,
    required this.name,
    required this.email,
    required this.location,
  });

  final String avatar;
  final String name;
  final String email;
  final String location;

  static List<Amigo> allFromResponse(String response) {
    var decodedJson = json.decode(response).cast<String, dynamic>();

    return decodedJson['results'].cast<Map<String, dynamic>>().map((obj) => Amigo.fromMap(obj)).toList().cast<Amigo>();
  }

  static Amigo fromMap(Map map) {
    var name = map['name'];

    return new Amigo(
      avatar: map['picture']['large'],
      name: '${_capitalize(name['first'])} ${_capitalize(name['last'])}',
      email: map['email'],
      location: _capitalize(map['location']['state']),
    );
  }

  static String _capitalize(String input) {
    return input.substring(0, 1).toUpperCase() + input.substring(1);
  }
}
