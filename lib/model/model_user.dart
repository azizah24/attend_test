class ModelUser {
  String id, password, nama, jabatan;

  ModelUser(
      {required this.id,
      required this.password,
      required this.jabatan,
      required this.nama});

  ModelUser.fromjson(Map<String, dynamic> json)
      : id = json['id'],
        password = json['password'],
        nama = json['nama'],
        jabatan = json['jabatan'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'password': password,
        'nama': nama,
        'jabatan': jabatan,
      };
}
