import 'package:flutter/material.dart';
import 'package:products/UI/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/provider.dart';
import '../../generated/l10n.dart';
import '../size_config.dart';
import '../theme.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
    required this.s,
    required this.provider,
  });

  final S s;
  final AppProvider provider;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor:provider.isLightTheme ?white:darkGreyClr ,
      child: Column(children: [
        Container(
          margin: EdgeInsets.all(SizeConfig.screenWidth * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                s.ChangeLan,
                style: titleStyle.copyWith(color:provider.isLightTheme ? darkGreyClr:white),
              ),
              sized(width: 7),
              Switch(
                value: provider.isArabic,
                onChanged: (value) {
                  provider.changeLocale(value);
                },
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () async {
            Navigator.pushReplacementNamed(context, LoginScreen.route);
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setBool('isUserLoggedIn', false);
          },
          child: Container(
            margin: EdgeInsets.all(SizeConfig.screenWidth * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  s.logOut,
                  style: titleStyle.copyWith(color:provider.isLightTheme ? darkGreyClr:white),
                ),
                Icon(
                  Icons.logout,
                  color: provider.isLightTheme ? darkGreyClr : white,
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
