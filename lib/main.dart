import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:products/UI/screens/home_page.dart';
import 'package:products/UI/screens/registeration_scree.dart';
import 'package:products/controller/provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'UI/screens/login_screen.dart';
import 'generated/l10n.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.removeAfter(intialization);
   SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isUserLoggedIn = prefs.getBool('isUserLoggedIn') ?? false;
  log(isUserLoggedIn.toString());
  runApp( ChangeNotifierProvider(
        create: (context) => AppProvider(),
        child:MyApp(isUserLoggedIn: isUserLoggedIn) ));
}

Future intialization(BuildContext context) async {
  await Future.delayed(const Duration(milliseconds: 1));
}

class MyApp extends StatelessWidget {
   final bool isUserLoggedIn;

  MyApp({required this.isUserLoggedIn});
  @override
  Widget build(BuildContext context) {
    return
         SafeArea(
          top: true,
          bottom: false,
          right: false,
          left: false,
          child: MaterialApp(
            locale:Provider.of<AppProvider>(context).isArabic?const Locale('ar'): const Locale('en'),
            localizationsDelegates:const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            initialRoute:isUserLoggedIn ?HomePage.route :LoginScreen.route ,
            routes: {
              LoginScreen.route: (context) => LoginScreen(),
              HomePage.route: (context) =>  HomePage(),
              RegisterScreen.route: (context) =>  RegisterScreen(),

            },
          ),
        )
        ;
  }
}
