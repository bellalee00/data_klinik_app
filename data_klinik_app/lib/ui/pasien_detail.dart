// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'pasien_page.dart'; 
import 'pasien_update_form.dart';
import '../model/pasien.dart';

class PasienDetail extends StatefulWidget {
  final Pasien pasien;

  const PasienDetail({super.key, required this.pasien});

  @override
  State<PasienDetail> createState() => _PasienDetailState();
}

class _PasienDetailState extends State<PasienDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Pasien")),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            "Nama Pasien : ${widget.pasien.namaPasien}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _tombolUbah(),
              _tombolHapus(),
            ],
          ),
           SizedBox(height: 20),
          Text(
            "ID Pasien : ${widget.pasien.idPasien}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _tombolUbah(),
              _tombolHapus(),
            ],
          ),
           SizedBox(height: 20),
          Text(
            "Nomor RM : ${widget.pasien.nomor_rm}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _tombolUbah(),
              _tombolHapus(),
            ],
          ),
           SizedBox(height: 20),
          Text(
            "Tanggal Lahir : ${widget.pasien.tanggal_lahir}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _tombolUbah(),
              _tombolHapus(),
            ],
          ),
           SizedBox(height: 20),
          Text(
            "Nomor Telepon : ${widget.pasien.nomor_telepon}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _tombolUbah(),
              _tombolHapus(),
            ],
          ),
           SizedBox(height: 20),
          Text(
            "Alamat : ${widget.pasien.alamat}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _tombolUbah(),
              _tombolHapus(),
            ],
          )
        ],
      ),
    );
  }

  _tombolUbah() {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PasienUpdateForm(pasien: widget.pasien)));
        },
        style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 76, 175, 80)),
        child: const Text("Ubah"));
  }


  _tombolHapus() { 
      return ElevatedButton( 
      onPressed: () { 
        AlertDialog alertDialog = AlertDialog( 
        content: const Text("Yakin ingin menghapus data ini?"), 
        actions: [ 
        // tombol ya 
          ElevatedButton( 
          onPressed: () { 
          Navigator.pop(context); 
          Navigator.pushReplacement(context, 
          MaterialPageRoute(builder: (context) => PasienPage())); 
          }, 
        child: const Text("YA"), 
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red), 
        ), 
        // tombol batal 
        ElevatedButton( 
        onPressed: () { 
        Navigator.pop(context); 
      }, 
        child: Text("Tidak"), 
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green), 
      ) 
    ], 
  ); 
      showDialog(context: context, builder: (context) => alertDialog); 
      }, 
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red), 
      child: const Text("Hapus")); 
    } 
  } 