part of 'vehicle_bloc.dart';

abstract class VehicleState {}

final class VehicleInitial extends VehicleState {}

final class PickedColorState extends VehicleState {
  Color selectedColor;
  PickedColorState({required this.selectedColor});
}

final class DatepickerState extends VehicleState {
  String date;
  DatepickerState({required this.date});
}

final class GroupImageState extends VehicleState {
  List<File> images;
  GroupImageState({required this.images});
}

final class ImagelimitedState extends VehicleState {}

final class DetailsAddedSucessfullyState extends VehicleState {}

final class DetaialAddedFailedState extends VehicleState {}

final class ErrorNotSelectPicState extends VehicleState{}