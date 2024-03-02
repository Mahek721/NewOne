import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Database? _database;
List WholeProjectDataList = [];

class ProjectsDB {
  Future get database async {
    if(_database != null) return _database;
    _database = await _initializeDB('Local3.db');
    return _database;
  }

  Future _initializeDB(String filepath) async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, filepath);
    return await openDatabase(path, version: 1, onCreate: _createEducationDB);
  }

  Future _createEducationDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ProjectData(
        id INTEGER PRIMARY KEY,
        PName TEXT NOT NULL,
        Role TEXT NOT NULL,
        CMonth TEXT NOT NULL,
        Team TEXT NOT NULL,
        Desc TEXT NOT NULL,
        Uid INTEGER NOT NULL
      )
    ''');
  }

  Future addEducationDataLocally({PName,Role,CMonth,Team,Desc,Uid}) async {
    final db = await database;       
    await db.insert("ProjectData",{
      "PName": PName,
      "Role": Role,
      "CMonth": CMonth,
      "Team": Team,
      "Desc": Desc,
      "Uid": Uid,
    });
    print("${PName} Added To Database Successfully..!");
    return 'Added';
  }

  Future readDataEducation() async {
    final db = await database;
    final allData = await db!.query("ProjectData");
    WholeProjectDataList = allData;
    print(WholeProjectDataList);
    return "Successfully Read";
  }

  Future deleteData({id}) async {
    final db = await database;
    await db.delete("ProjectData", where: 'id=?', whereArgs: [id],);
    print("Delete Successfully ${id}");
    return "Delete Data Successfully..!";
  }

  Future deleteWholeDB() async {
    final db = await database;
    await db.delete('ProjectData');
    print("Delete Successfully");
    return "Successfully Delete";
  }
}