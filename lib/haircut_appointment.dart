import 'package:flutter/material.dart';

class HaircutAppointment {
  final DateTime date;
  final TimeOfDay time;
  final String stylist;

  HaircutAppointment({
    required this.date,
    required this.time,
    required this.stylist,
  });
}
