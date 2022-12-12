class Data {
  String judul;
  String detail;
  String gambar;

  Data({required this.judul, required this.detail, required this.gambar});

  factory Data.fromJson(Map map) {
    return Data(
        judul: map['judul'], detail: map['detail'], gambar: map['gambar']);
  }
}
