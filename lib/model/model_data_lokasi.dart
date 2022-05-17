class ModelLokasi {
  String nama_alamat;
  double long, lat;

  ModelLokasi.fromjson(Map<String, dynamic> json)
      : nama_alamat = json['nama_alamat'],
      long = json['long'],
      lat = json['lat'];
}
