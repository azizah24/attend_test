class ModelDataAbsen {
  String mulai, akhir;
  double lat, long;

  ModelDataAbsen(
      {required this.mulai,
      required this.akhir,
      required this.lat,
      required this.long});

  ModelDataAbsen.fromjson(Map<String, dynamic> json)
      : mulai = json['mulai'],
        akhir = json['akhir'],
        lat = json['lat'],
        long = json['long'];

  Map<String, dynamic> toJson() => {
        'mulai': mulai,
        'akhir': akhir,
        'lat': lat,
        'long': long,
      };
}
