// ignore_for_file: unnecessary_string_interpolations

import 'package:data_klinik_app/ui/pasien_detail.dart';
import 'package:flutter/material.dart';
import '../model/pasien.dart';

class PasienItem extends StatelessWidget {
  final Pasien pasien;

  const PasienItem({super.key, required this.pasien});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text("${pasien.namaPasien}"),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PasienDetail(pasien: pasien)));
      },
    );
  }
}