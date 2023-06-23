import 'package:flutter/material.dart';
import 'package:products/UI/theme.dart';

Widget showLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: prmClr,
      ),
    );
  }