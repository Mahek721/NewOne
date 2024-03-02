import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Database? _database;
List WholeExperienceDataList = [];

class ExperienceDB {
  Future get database async {
    if(_database != null) return _database;
    _database = await _initializeDB('Local2.db');
    return _database;
  }

  Future _initializeDB(String filepath) async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, filepath);
    return await openDatabase(path, version: 1, onCreate: _createEducationDB);
  }

  Future _createEducationDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ExprData(
        id INTEGER PRIMARY KEY,
        CName TEXT NOT NULL,
        Role TEXT NOT NULL,
        Month TEXT NOT NULL,
        Desc TEXT NOT NULL,
        Uid INTEGER NOT NULL
      )
    ''');
  }

  Future addEducationDataLocally({CName,Role,Month,Desc,Uid}) async {
    final db = await database;       
    await db.insert("ExprData",{
      "CName": CName,
      "Role": Role,
      "Month": Month,
      "Desc": Desc,
      "Uid": Uid,
    });
    print("${CName} Added To Database Successfully..!");
    return 'Added';
  }

  Future readDataEducation() async {
    final db = await database;
    final allData = await db!.query("ExprData");
    WholeExperienceDataList = allData;
    print(WholeExperienceDataList);
    return "Successfully Read";
  }

  Future deleteData({id}) async {
    final db = await database;
    await db.delete("ExprData", where: 'id=?', whereArgs: [id],);
    print("Delete Successfully ${id}");
    return "Delete Data Successfully..!";
  }

  Future deleteWholeDB() async {
    final db = await database;
    await db.delete('ExprData');
    print("Delete Successfully");
    return "Successfully Delete";
  }
}