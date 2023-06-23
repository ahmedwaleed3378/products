import 'package:flutter/material.dart';
import 'package:products/UI/screens/registeration_scree.dart';
import 'package:products/UI/size_config.dart';
import 'package:products/UI/theme.dart';
import 'package:products/UI/screens/home_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/provider.dart';
import '../../generated/l10n.dart';
import '../widgets/my_elevated_button.dart';
import '../widgets/my_field.dart';
import '../widgets/my_textbutton.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  static const String route = '/login';
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
  var s = S.of(context);
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor:
            Provider.of<AppProvider>(context, listen: false).isLightTheme
                ? white
                : darkGreyClr,
        appBar: AppBar(
          title: Text(
            '${s.login}',
            style: headingStyle,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    field(
                      email,
                      '${s.Email}',context,
                    ),
                    field(
                      password,
                      '${s.Password}',context,
                      isObsecure: true,
                      validator: (value) {
                        if (value!.isEmpty || value.length < 6) {
                          return '${s.Please}';
                        } else {
                          return null;
                        }
                      },
                    ),
                    sized(height: 20),
                    MyElevatedButton(
                      label: '${s.login}',
                      onPressed: () async{
                        if (_formkey.currentState!.validate()) {
                           SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        await prefs
                            .setBool('isUserLoggedIn', true)
                            .whenComplete(() => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ))  );
                        }
                      },
                    ),
                    sized(height: 15),
                    MyTextButton(
                      label: '${s.craete}',
                      onPressed: ()  {
                     Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterScreen(),
                                ));
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
