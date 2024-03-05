import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Sqldb {
  static Database? _db;

  Future<Database?> get dp async {
    if (_db == null) {
      _db = await intialDB();
      return _db;
    } else {
      return _db;
    }
  }

  intialDB() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'marwanragab.db');
    Database mydb = await openDatabase(path,
        onCreate: _oncreate, version: 7, onUpgrade: _onupgrade);
    return mydb;
  }

  _onupgrade(Database db, int oldversion, int newversion) async {
    print('UPgrade==============================');
    await db.execute(''' ALTER TABLE "notes"
ADD COLUMN "color" TEXT''');
  }

  _oncreate(Database db, int version) async {
    Batch batch = db.batch();
    batch.execute('''
    CREATE TABLE "notes"(
      "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      "title" Text NOT NULL,
      "note" Text NOT NULL
    )
    ''');
    await batch.commit();
    print("create=============================");
  }

  readData(String sql) async {
    Database? mydb = await dp;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? mydb = await dp;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? mydb = await dp;
    int response = await mydb!.rawDelete(sql);
    return response;
  }

  ubdateData(String sql) async {
    Database? mydb = await dp;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  mydeletDatabase() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'marwanragab.db');
    await deleteDatabase(path);
  }
}
