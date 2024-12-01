import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbAdmin {
  Database? myDatabase;

  Future<Database?> _checkDatabase() async {
    if (myDatabase == null) {
      myDatabase = await _initDatabase();
    }
    return myDatabase;
  }

  Future<Database> _initDatabase() async {
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

  //INSERCIÓN DE DATOS
  Future<int> insertarGasto() async {
    Database? db = await _checkDatabase();
    int res = await db!.insert("GASTOS", {
      "title": "Deuda BCP",
      "price": 1200.50,
      "datetime": "01/12/2024",
      "type": "Bancos",
    });
    print(res);
    return res;
  }

  //OBTENER DATOS
  obtenerGastos() async {
    Database? db = await _checkDatabase();
    List data = await db!
        .query("GASTOS", columns: ["title", "price"], where: "type='Bancos'");

    // List data = await db!
    //     .rawQuery("SELECT TITLE, TYPE FROM GASTOS WHERE TYPE = 'Bancos'");
    print(data);
  }
}
