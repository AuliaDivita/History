class ModelSiMain {
  String? nama;
  String? history;
  String? img;

  ModelSiMain(this.nama, this.history, this.img);

  ModelSiMain.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    history = json['history'];
    img = json['img'];
  }
}
