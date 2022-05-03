import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onSubmitted;
  final String label;
  final TextInputType? keyboardType;

  const AdaptativeTextField({
    required this.controller,
    required this.onSubmitted,
    required this.label,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return !Platform.isIOS
        ? Padding(
          padding: const EdgeInsets.only(
            bottom: 10,
          ),
          child: CupertinoTextField(
              controller: controller,
              onSubmitted: onSubmitted,
              placeholder: label,
              keyboardType: keyboardType,
              padding: EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12
              ),
            ),
        )
        : TextField(
            controller: controller,
            keyboardType: keyboardType,
            onSubmitted: onSubmitted,
            decoration: InputDecoration(
              labelText: label,
            ),
          );
  }
}
