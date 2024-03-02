import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Database? _database;
List WholeSkillsDataList = [];

class SkillsDB {
  Future get database async {
    if(_database != null) return _database;
    _database = await _initializeDB('Local4.db');
    return _database;
  }

  Future _initializeDB(String filepath) async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, filepath);
    return await openDatabase(path, version: 1, onCreate: _createEducationDB);
  }

  Future _createEducationDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE SkillsData(
        id INTEGER PRIMARY KEY,
        Skills TEXT NOT NULL,
        Uid INTEGER NOT NULL
      )
    ''');
  }

  Future addEducationDataLocally({Skills,Uid}) async {
    final db = await database;       
    await db.insert("SkillsData",{
      "Skills": Skills,
      "Uid": Uid,
    });
    print("${Skills} Added To Database Successfully..!");
    return 'Added';
  }

  Future readDataEducation() async {
    final db = await database;
    final allData = await db!.query("SkillsData");
    WholeSkillsDataList = allData;
    print(WholeSkillsDataList);
    return "Successfully Read";
  }

  Future updateData({Skills,id}) async {
    final db = await database;
    int dbupdateid = await db.rawUpdate(
      'UPDATE LocalData SET Skills=? WHERE id=?', [Skills,id]);
    return dbupdateid;
  }

  Future deleteData({id}) async {
    final db = await database;
    await db.delete("SkillsData", where: 'id=?', whereArgs: [id],);
    print("Delete Successfully ${id}");
    return "Delete Data Successfully..!";
  }

  Future deleteWholeDB() async {
    final db = await database;
    await db.delete('SkillsData');
    print("Delete Successfully");
    return "Successfully Delete";
  }
}