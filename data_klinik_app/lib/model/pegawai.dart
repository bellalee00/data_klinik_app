// ignore_for_file: non_constant_identifier_names

class Pegawai {
  String? id;
  String namaPegawai;
  String nip;
  String tanggal_lahir;
  String nomor_telepon;
  String email;
  String password;

  Pegawai({this.id,required this.namaPegawai,
    required this.nip,
    required this.tanggal_lahir,
    required this.nomor_telepon,
    required this.email,
    required this.password,
  });

  // toJson untuk mengonversi objek Pegawai menjadi map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'namaPegawai': namaPegawai,
      'nip': nip,
      'tanggal_lahir': tanggal_lahir,
      'nomor_telepon': nomor_telepon,
      'email': email,
      'password': password,
      // tambahkan sisa properti yang ingin Anda masukkan ke dalam JSON
    };
  }

  // fromJson untuk mengonversi map menjadi objek Pegawai
  factory Pegawai.fromJson(Map<String, dynamic> json) {
    return Pegawai(
      id: json[' '],
      namaPegawai: json['namaPegawai'],
      nip: json['nip'],
      tanggal_lahir: json['tanggal_lahir'],
      nomor_telepon: json['nomor_telepon'],
      email: json['email'],
      password: json['password'],
      // tambahkan sisa properti yang ingin Anda ambil dari JSON
    );
  }
}
