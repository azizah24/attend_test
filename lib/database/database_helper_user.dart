import 'package:attend_test/database/database_user.dart';
import 'package:attend_test/model/model_user.dart';

class DatabaseHelperUser {
  final koneksi_database = DatabaseUser.instance;

  addDataUser(ModelUser modelUser) async {
    var client = await koneksi_database.database_;
    try {
      var result = client?.insert(DatabaseUser.tb_user, modelUser.toJson());
    } catch (e) {
      print(e);
    }
  }

  Future<List<ModelUser>> fetchAllInfo() async {
    final dbClient = await koneksi_database.database_;
    List<ModelUser> datalist = [];
    try {
      final maps = await dbClient!.query(DatabaseUser.tb_user);
      for (var item in maps) {
        datalist.add(ModelUser.fromjson(item));
      }
    } catch (e) {
      print(e);
    }
    return datalist;
  }
}
