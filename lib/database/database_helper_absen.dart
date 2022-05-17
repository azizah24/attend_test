import 'package:attend_test/database/database_absen.dart';
import 'package:attend_test/database/database_absen.dart';
import 'package:attend_test/database/database_absen.dart';
import 'package:attend_test/database/database_user.dart';
import 'package:attend_test/model/model_data_absen.dart';
import 'package:attend_test/model/model_user.dart';

class DatabaseHelperAbsen {
  final koneksi_database = DatabaseAbsen.instance;

  addDataUser(ModelDataAbsen ModelAbsen) async {
    var client = await koneksi_database.database_;
    try {
      var result = client?.insert(DatabaseAbsen.tb_absen, ModelAbsen.toJson());
    } catch (e) {
      print(e);
    }
  }

  Future<List<ModelDataAbsen>> fetchAllInfo() async {
    final dbClient = await koneksi_database.database_;
    List<ModelDataAbsen> datalist = [];
    try {
      final maps = await dbClient!.query(DatabaseAbsen.tb_absen);
      for (var item in maps) {
        datalist.add(ModelDataAbsen.fromjson(item));
      }
    } catch (e) {
      print(e);
    }
    return datalist;
  }
}
