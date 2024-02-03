// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:carnova/bloc/vehicle_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupImages extends StatelessWidget {
  GroupImages({super.key});
  List<File> images = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10, bottom: 20),
      child: BlocBuilder<VehicleBloc, VehicleState>(
        builder: (context, state) {
          if (state is GroupImageState) {
            images = state.images;
          }
          return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 15.0,
              ),
              itemCount: images.length,
              itemBuilder: (BuildContext context, int index) {
                File image = images[index];
                return GridTile(
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: FileImage(image), fit: BoxFit.cover),
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                );
              });
        },
      ),
    );
  }
}
