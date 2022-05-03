import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateChanged;

  AdaptativeDatePicker(
      {required this.selectedDate, required this.onDateChanged});

  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 90)),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      onDateChanged(pickedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: DateTime.now(),
            minimumDate: DateTime.now().subtract(Duration(days: 90)),
            maximumDate: DateTime.now(),
            onDateTimeChanged: onDateChanged,
          )
        : Container(
            height: 70,
            child: Row(
              children: [
                Text(
                  selectedDate == null
                      ? 'Nenhuma data selecionada!'
                      : 'Data Selecionada: ${DateFormat('dd/MM/yyyy').format(selectedDate)}',
                ),
                TextButton(
                  child: Text('Selecionar Data'),
                  style: TextButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  onPressed: () => _showDatePicker(context),
                ),
              ],
            ),
          );
  }
}
