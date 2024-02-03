// ignore_for_file: use_build_context_synchronously

import 'package:carnova/bloc/vehicle_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DatePickerFun {
  static getTimeFromUser(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    final DateTime? pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2123));
    if (pickerDate != null) {
      selectedDate = pickerDate;
      context.read<VehicleBloc>().add(
          DatePickedEvent(manufactDate: DateFormat.yMd().format(selectedDate)));
    } else {}
  }
}
