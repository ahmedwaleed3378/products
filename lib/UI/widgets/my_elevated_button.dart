import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/provider.dart';
import '../theme.dart';

class MyElevatedButton extends StatelessWidget {
  const MyElevatedButton({
    super.key,
    required this.onPressed,
    required this.label,
  });
  final void Function()? onPressed;
  final String label;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(prmClr),
            elevation: MaterialStateProperty.all(10),
            padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)))),
        onPressed: onPressed,
        child: Text(
          label,
          style: subheadingStyle.copyWith(
              color: provider.isLightTheme ? white :darkGreyClr ),
        ));
  }
}
