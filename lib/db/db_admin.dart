import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbAdmin {
  Database? myDatabase;

  checkDatabase() async {
    if (myDatabase == null) {
      myDatabase = await initDatabase();
    } else {
      return myDatabase;
    }
  }

  Future<Database> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    print(directory);
    String pathDatabase = join(directory.path, "GastosDB.db");
    print(pathDatabase);
    return await openDatabase(pathDatabase, version: 1,
        onCreate: (Database db, int version) {
      db.execute("""CREATE TABLE GASTOS (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            price REAL,
            datetime TEXT,
            type TEXT
          )""");
    });
  }
}
