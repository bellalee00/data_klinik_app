class Pasien {
  String? id;
  String namaPasien;

  Pasien({this.id, required this.namaPasien});


  String get idPasien => 'id pasien'; 
  String get nomor_rm => 'nomor rm';
  String get tanggal_lahir => 'tanggal lahir';
  String get nomor_telepon => 'nomor telepon';
  String get alamat => 'alamat';

  Map<String, dynamic> toJson() {
    return {
      'id': idPasien,
      'namaPasien': namaPasien,
      
    };
  }

  
  factory Pasien.fromJson(Map<String, dynamic> json) {
    return Pasien(
      id: json['idPasien'],
      namaPasien: json['namaPasien'],
      
    );
  }
}
