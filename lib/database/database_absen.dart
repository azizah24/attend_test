import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseAbsen {
  DatabaseAbsen.internal();
  static final DatabaseAbsen instance = new DatabaseAbsen.internal();
  factory DatabaseAbsen() => instance;
  static final tb_absen = 'tb_absen';
  static final versi = 1;

  static Database? db;

  Future<Database?> get database_ async {
    if (db != null) {
      return db;
    }
    db = await initdb_User();
    return db;
  }

  Future<Database> initdb_User() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String dbpath = join(directory.path, 'db_absen.db');
    var opendb = await openDatabase(dbpath, version: versi,
        onCreate: (Database database_, int versi) async {
      await database_.execute("""
      CREATE TABLE $tb_absen(
      mulai TEXT,
      akhir TEXT,
      lat REAL,
      long REAL
      )
      """);
    }, onUpgrade: (Database database_, int oldversi, int newversi) async {
      if (oldversi < newversi) {}
    });
    return opendb;
  }
}
