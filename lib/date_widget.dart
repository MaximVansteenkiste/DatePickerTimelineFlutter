/// ***
/// This class consists of the DateWidget that is used in the ListView.builder
///
/// Author: Vivek Kaushik <me@vivekkasuhik.com>
/// github: https://github.com/iamvivekkaushik/
/// ***

import 'package:date_picker_timeline/gestures/tap.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateWidget extends StatelessWidget {
  final double? width;
  final DateTime date;
  final TextStyle? monthTextStyle, dayTextStyle, dateTextStyle;
  final Color selectionColor;
  final Color borderColor;
  final DateSelectionCallback? onDateSelected;
  final String? locale;
  final bool hasDotIndicator;

  DateWidget({
    required this.date,
    required this.monthTextStyle,
    required this.dayTextStyle,
    required this.dateTextStyle,
    required this.selectionColor,
    required this.borderColor,
    this.hasDotIndicator = false,
    this.width,
    this.onDateSelected,
    this.locale,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          child: Container(
            width: width,
            margin: EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              border: Border.all(
                color: borderColor,
                width: 2,
              ),
              color: selectionColor,
            ),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                      new DateFormat("MMM", locale)
                          .format(date)
                          .toUpperCase(), // Month
                      style: monthTextStyle),
                  Text(date.day.toString(), // Date
                      style: dateTextStyle),
                  Text(
                      new DateFormat("E", locale)
                          .format(date)
                          .toUpperCase(), // WeekDay
                      style: dayTextStyle)
                ],
              ),
            ),
          ),
          onTap: () {
            // Check if onDateSelected is not null
            if (onDateSelected != null) {
              // Call the onDateSelected Function
              onDateSelected!(this.date);
            }
          },
        ),
        if (hasDotIndicator)
          Positioned(
              right: 0,
              top: 0,
              child: Container(
                width: 10.0,
                height: 10.0,
                decoration: new BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ))
      ],
    );
  }
}
