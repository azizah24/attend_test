class ModelLokasi {
  String nama_alamat;
  double long, lat;

  ModelLokasi(
      {required this.nama_alamat, required this.lat, required this.long});

  ModelLokasi.fromjson(Map<String, dynamic> json)
      : nama_alamat = json['nama_alamat'],
        long = json['long'],
        lat = json['lat'];

  Map<String, dynamic> toJson() => {
        'nama_alamat': nama_alamat,
        'long': long,
        'lat': lat,
      };
}
