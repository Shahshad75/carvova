part of 'vehicle_bloc.dart';

abstract class VehicleEvent {}

final class DatePickedEvent extends VehicleEvent {
  String manufactDate;
  DatePickedEvent({required this.manufactDate});
}

final class AddImageEvent extends VehicleEvent {
  File image;
  AddImageEvent({required this.image});
}

final class AddCarDetailsEvent extends VehicleEvent {
  String model;
  String color;
  String wheelTypr;
  String vehicleBrand;
  AddCarDetailsEvent(
      {required this.model,
      required this.wheelTypr,
      required this.vehicleBrand,
      required this.color});
}
