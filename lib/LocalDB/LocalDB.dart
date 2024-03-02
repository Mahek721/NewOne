import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Database? _database;
List WholeDataList = [];

class LocalDatabase {
  Future get database async {
    if(_database != null) return _database;
    _database = await _initializeDB('Local.db');
    return _database;
  }

  Future _initializeDB(String filepath) async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, filepath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE UserData(
        id INTEGER PRIMARY KEY,
        Email TEXT NOT NULL,
        FullName TEXT NOT NULL,
        MoNo TEXT NOT NULL,
        Gender TEXT NOT NULL,
        DOB TEXT NOT NULL,
        MStatus TEXT NOT NULL,
        Languages TEXT NOT NULL,
        Address TEXT NOT NULL,
        Objectives TEXT NOT NULL
      )
    ''');
  }

  Future addDataLocally({Email,FullName,MoNo,Gender,DOB,MStatus,Languages,Address,Objectives}) async {
    final db = await database;       
    await db.insert("UserData",{
      "Email": Email,
      "FullName": FullName,
      "MoNo": MoNo,
      "Gender": Gender,
      "DOB": DOB,
      "MStatus": MStatus,
      "Languages": Languages,
      "Address": Address,
      "Objectives": Objectives
    });
    print("${Email} Added To Database Successfully..!");
    return 'Added';
  }

  Future readData() async {
    final db = await database;
    final allData = await db!.query("UserData");
    WholeDataList = allData;
    print(WholeDataList);
    return "Successfully Read";
  }

  Future deleteData({id}) async {
    final db = await database;
    await db.delete("UserData", where: 'id=?', whereArgs: [id],);
    print("Delete Successfully ${id}");
    return "Delete Data Successfully..!";
  }

  Future deleteWholeDB() async {
    final db = await database;
    await db.delete('UserData');
    print("Delete Successfully");
    return "Successfully Delete";
  }
}