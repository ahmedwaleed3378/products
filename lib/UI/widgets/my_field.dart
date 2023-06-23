
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

Container field(TextEditingController holder, String label, BuildContext context,
    {String? Function(String?)? validator,
    bool isObsecure = false,
   
    FocusNode? focusNode}) {
      var s = S.of(context);
  return Container(
    margin:const EdgeInsets.all(5),
    child: TextFormField(
      controller: holder,
      focusNode: focusNode,
      obscureText: isObsecure,
      validator: validator ??
          (value) {
            if (value!.isEmpty) {
              return s.Empty;
            } else {
              return null;
            }
          },
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none),
          labelText: label,
          fillColor: Colors.white,
          filled: true),
    ),
  );
}
