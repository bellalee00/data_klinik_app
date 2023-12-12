// ignore_for_file: prefer_const_constructors

import 'package:data_klinik_app/widget/sidebar.dart';
import 'package:data_klinik_app/model/pasien.dart';
import 'package:flutter/material.dart';
import 'package:data_klinik_app/ui/pasien_item.dart';
import 'package:data_klinik_app/ui/pegawai_form.dart';

class PasienPage extends StatefulWidget {
  const PasienPage({super.key});

  @override
  State<PasienPage> createState() => _PasienPageState();
}

class _PasienPageState extends State<PasienPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      backgroundColor: Color.fromARGB(255, 158, 202, 252),
      appBar: AppBar(
        title: const Text("Data Pasien"),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => PegawaiForm()));
            },
          )
        ],
      ),
      body: ListView(
        children: [
          PasienItem(pasien: Pasien(namaPasien: "Pasien")),

        ],
      ),
    );
  }
}