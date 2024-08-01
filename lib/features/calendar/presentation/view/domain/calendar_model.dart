import 'package:flutter/material.dart';

class CalendarModel {
  final String? title;
  final Color? rightColor;
  final Color? leftColor;
  final String? dueDate;

  CalendarModel( {this.dueDate,
     this.title,
     this.rightColor,
     this.leftColor,
  });
}
