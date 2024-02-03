import 'package:carnova/model/vehicle_model.dart';
import 'package:carnova/widget/text_widget.dart/subtile.dart';
import 'package:carnova/widget/vehicle_screen/car_details.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarDataShow extends StatelessWidget {
  const CarDataShow({super.key, required this.vehicleData});
  final Vehicle vehicleData;
  @override
  Widget build(BuildContext context) {
    List<String> cardetails = [
      vehicleData.brand,
      vehicleData.model,
      vehicleData.mfd,
      vehicleData.wheeltype,
      vehicleData.color
    ];
    double heigth = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 239, 239),
      appBar: AppBar(
        title: Text(
          vehicleData.model,
          style: GoogleFonts.outfit(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Hero(
                  tag: vehicleData.model,
                  child: Container(
                      height: heigth / 3.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(vehicleData.images.first),
                              fit: BoxFit.cover)))),
              const SizedBox(height: 5),
              HomeTitles(titles: "Car Details"),
              const SizedBox(height: 10),
              CarDetailsCard(cardetails: cardetails),
              const SizedBox(height: 10),
              HomeTitles(titles: "More Images"),
              CarMoreImages(images: vehicleData.images)
            ],
          ),
        ),
      ),
    );
  }
}

class CarMoreImages extends StatelessWidget {
  const CarMoreImages({super.key, required this.images});
  final List images;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          viewportFraction: 0.9,
          height: MediaQuery.sizeOf(context).height / 4,
          autoPlay: true),
      items: images.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(i), fit: BoxFit.cover)));
          },
        );
      }).toList(),
    );
  }
}
