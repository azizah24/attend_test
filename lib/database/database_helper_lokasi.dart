import 'package:attend_test/database/database_absen.dart';
import 'package:attend_test/database/database_absen.dart';
import 'package:attend_test/database/database_absen.dart';
import 'package:attend_test/database/database_lokasi.dart';
import 'package:attend_test/database/database_lokasi.dart';
import 'package:attend_test/database/database_lokasi.dart';
import 'package:attend_test/database/database_user.dart';
import 'package:attend_test/model/model_data_absen.dart';
import 'package:attend_test/model/model_data_lokasi.dart';
import 'package:attend_test/model/model_user.dart';

class DatabaseHelperLokasi {
  final koneksi_database = DatabaseLokasi.instance;

  addDataUser(ModelLokasi modelLokasi) async {
    var client = await koneksi_database.database_;
    try {
      var result = client?.insert(DatabaseLokasi.tb_lokasi, modelLokasi.toJson());
    } catch (e) {
      print(e);
    }
  }

  Future<List<ModelLokasi>> fetchAllInfo() async {
    final dbClient = await koneksi_database.database_;
    List<ModelLokasi> datalist = [];
    try {
      final maps = await dbClient!.query(DatabaseLokasi.tb_lokasi);
      for (var item in maps) {
        datalist.add(ModelLokasi.fromjson(item));
      }
    } catch (e) {
      print(e);
    }
    return datalist;
  }
}
