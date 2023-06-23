import 'package:flutter/material.dart';
import 'package:products/UI/size_config.dart';
import 'package:products/UI/theme.dart';
import 'package:products/controller/provider.dart';
import 'package:products/generated/l10n.dart';
import 'package:provider/provider.dart';

Widget buildNoInternetWidget(BuildContext context) {
  var provider = Provider.of<AppProvider>(context);
  var s = S.of(context);
  SizeConfig().init(context);
  return Center(
    child: Container(
      color: provider.isLightTheme ? white : darkGreyClr,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          sized(height: 20),
          Text(
            s.cant,
            style: TextStyle(
              fontSize: 22,
              color: provider.isLightTheme ? darkGreyClr : white,
            ),
          ),
          sized(height: 20),
          Image.asset(
            'assets/no_internet.png',
            width: SizeConfig.orientation == Orientation.portrait ? 250 : 150,
            height: SizeConfig.orientation == Orientation.portrait ? 250 : 150,
            fit: BoxFit.fill,
          )
        ],
      ),
    ),
  );
}
