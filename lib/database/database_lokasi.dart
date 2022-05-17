import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseLokasi {
  DatabaseLokasi.internal();
  static final DatabaseLokasi instance = new DatabaseLokasi.internal();
  factory DatabaseLokasi() => instance;
  static final tb_lokasi = 'tb_lokasi';
  static final versi = 1;

  static Database? db;

  Future<Database?> get database_ async {
    if (db != null) {
      return db;
    }
    db = await initdb_Lokasi();
    return db;
  }

  Future<Database> initdb_Lokasi() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String dbpath = join(directory.path, 'db_lokasi.db');
    var opendb = await openDatabase(dbpath, version: versi,
        onCreate: (Database database_, int versi) async {
      await database_.execute("""
      CREATE TABLE $tb_lokasi(
      nama_alamat TEXT, 
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
