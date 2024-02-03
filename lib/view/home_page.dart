import 'package:carnova/model/vehicle_model.dart';
import 'package:carnova/view/addcar_screen.dart';
import 'package:carnova/widget/car_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //  final media = MediaQuery.sizeOf(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AddVehicle()));
          },
          label: const Row(
            children: [
              Icon(
                Icons.car_crash,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Add Vehicle",
                style: TextStyle(color: Colors.white),
              )
            ],
          )),
      appBar: AppBar(
        title: Text(
          "Carnova",
          style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 222, 221, 221),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('cars').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('No Data Available'),
            );
          }
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              final Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              Vehicle details = Vehicle.fromJson(data);

              return CarTile(
                details: details,
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
