import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Database? _database;
List WholeEducationDataList = [];

class EducationDB {
  Future get database async {
    if(_database != null) return _database;
    _database = await _initializeDB('Local1.db');
    return _database;
  }

  Future _initializeDB(String filepath) async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, filepath);
    return await openDatabase(path, version: 1, onCreate: _createEducationDB);
  }

  Future _createEducationDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE EducationData(
        id INTEGER PRIMARY KEY,
        Course TEXT NOT NULL,
        UName TEXT NOT NULL,
        Year TEXT NOT NULL,
        Pr TEXT NOT NULL,
        Desc TEXT NOT NULL,
        Uid INTEGER NOT NULL
      )
    ''');
  }

  Future addEducationDataLocally({Course,UName,Year,Pr,Desc,Uid}) async {
    final db = await database;       
    await db.insert("EducationData",{
      "Course": Course,
      "UName": UName,
      "Year": Year,
      "Pr": Pr,
      "Desc": Desc,
      "Uid": Uid,
    });
    print("${Course} Added To Database Successfully..!");
    return 'Added';
  }

  Future readDataEducation() async {
    final db = await database;
    final allData = await db!.query("EducationData");
    WholeEducationDataList = allData;
    print(WholeEducationDataList);
    return "Successfully Read";
  }

  Future deleteData({id}) async {
    final db = await database;
    await db.delete("EducationData", where: 'id=?', whereArgs: [id],);
    print("Delete Successfully ${id}");
    return "Delete Data Successfully..!";
  }

  Future deleteWholeDB() async {
    final db = await database;
    await db.delete('EducationData');
    print("Delete Successfully");
    return "Successfully Delete";
  }
}