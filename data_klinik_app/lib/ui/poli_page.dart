// ignore_for_file: unused_import

import 'package:data_klinik_app/service/poli_service.dart';
import 'package:data_klinik_app/widget/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:data_klinik_app/ui/poli_form.dart';
import '../model/poli.dart';
import 'package:data_klinik_app/ui/poli_item.dart';
import 'package:data_klinik_app/ui/poli_update_form.dart';

class PoliPage extends StatefulWidget {
  const PoliPage({super.key});

  @override
  State<PoliPage> createState() => _PoliPageState();
}

class _PoliPageState extends State<PoliPage> {
  Stream<List<Poli>> getList() async* {
    List<Poli> data = await PoliService().listData();
    yield data;
}
  
  Future refreshData() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      getList();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      backgroundColor: Color.fromARGB(255, 192, 207, 223),
      appBar: AppBar(
        title: const Text("Data Poli"),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => PoliForm()));
            },
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: refreshData,
        child: StreamBuilder(
          stream: getList(),
          builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return Text('Data Kosong');
          }
      
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return PoliItem(poli: snapshot.data[index]);
            },
          );
        },
          ),
      ),
  );
 }
}