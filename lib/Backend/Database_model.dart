import 'package:path/path.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';

class Word {
  int id;
  String word;
  String song;
  Word({this.id, this.word, this.song});

  factory Word.fromMap(Map<String, dynamic> data) => new Word(
        id: data["id"],
        word: data["word"],
        song: data["song"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "word": word,
        "song": song,
      };

  var db;
  var lun;
  Future<List> runQuery(int id, bool key) async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "inApp.db");

// Check if the database exists
    var exists = await databaseExists(path);

// I'm making changes on the original DB so I override 'exists = false' in order to copy a fresh // instance each time my app runs.
    exists = false;

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", "Database.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      //   await db.execute('PRAGMA foreign_keys = ON');

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }

    // open the database
    db = await openDatabase(
      path,
      readOnly: false,
    );

    var listWord = await db.rawQuery('SELECT * FROM word WHERE id is $id');
    Map<String, dynamic> mapRead = listWord.first;
    String songs = mapRead['song'];
    var combinedList = [];
    if (key == true) {
      combinedList = List.from(listWord);
    }
    lun = songs.length;
    for (int i = 0; i < songs.length; i++) {
      String index = songs[i];
      var listSong = await db.rawQuery('SELECT * FROM song WHERE id is $index');
      combinedList.addAll(listSong);
    }
    print(combinedList);
    return (combinedList);
  }
}
