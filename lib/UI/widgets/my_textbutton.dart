import 'package:flutter/material.dart';
import 'package:products/controller/provider.dart';
import 'package:provider/provider.dart';

import '../screens/registeration_scree.dart';
import '../theme.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    super.key,
    required this.label,
    this.onPressed,
  });
  final String label;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    
    return TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: bodyStyle.copyWith(color: prmClr),
        ));
  }
}
