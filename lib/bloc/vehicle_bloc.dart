import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:carnova/resource/service/repo.dart';
import 'package:flutter/material.dart';

part 'vehicle_event.dart';
part 'vehicle_state.dart';

class VehicleBloc extends Bloc<VehicleEvent, VehicleState> {
  List<File> images = [];
  List<String> imageUrls = [];
  String date = "";
  VehicleBloc() : super(VehicleInitial()) {
    on<DatePickedEvent>(datePickedEvent);
    on<AddImageEvent>(addImageEvent);
    on<AddCarDetailsEvent>(addCarDetailsEvent);
  }

  FutureOr<void> datePickedEvent(
      DatePickedEvent event, Emitter<VehicleState> emit) {
    date = event.manufactDate;
    emit(DatepickerState(date: event.manufactDate));
  }

  FutureOr<void> addImageEvent(
      AddImageEvent event, Emitter<VehicleState> emit) async {
    if (images.length >= 4) {
      emit(ImagelimitedState());
    } else {
      images.add(event.image);
      String imageUrl = await Repo.getImageUrl(File(event.image.path));

      if (images.isNotEmpty) {
        imageUrls.add(imageUrl);
      }
      emit(GroupImageState(images: images));
    }
  }

  FutureOr<void> addCarDetailsEvent(
      AddCarDetailsEvent event, Emitter<VehicleState> emit) async {
    if (images.isNotEmpty) {
      bool added = await Repo.addCarDocument(event.model, event.color, date,
          event.wheelTypr, imageUrls, event.vehicleBrand);
      if (added) {
        emit(DetailsAddedSucessfullyState());
        imageUrls.clear();
        images.clear();
      } else {
        emit(DetaialAddedFailedState());
      }
    } else {
      emit(ErrorNotSelectPicState());
    }
  }
}
