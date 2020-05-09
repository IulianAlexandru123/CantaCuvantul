import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class User {
  String name;
  String caracter;
  int points;

  User({this.name, this.caracter, this.points});

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        name: json["name"],
        caracter: json["caracter"],
        points: json["points"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "caractert": caracter,
        "points": points,
      };
}

class SharedPref {
  SharedPreferences prefs;
  List<String> list;

  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key));
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
