import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseUser {
  DatabaseUser.internal();
  static final DatabaseUser instance = new DatabaseUser.internal();
  factory DatabaseUser() => instance;
  static final tb_user = 'tb_user';
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
    String dbpath = join(directory.path, 'db_user.db');
    var opendb = await openDatabase(dbpath, version: versi,
        onCreate: (Database database_, int versi) async {
      await database_.execute("""
      CREATE TABLE $tb_user(
      id TEXT,
      password TEXT,
      nama TEXT,
      jabatan TEXT
      )
      """);
    }, onUpgrade: (Database database_, int oldversi, int newversi) async {
      if (oldversi < newversi) {}
    });
    return opendb;
  }
}
