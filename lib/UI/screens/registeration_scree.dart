import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:products/UI/screens/home_page.dart';
import 'package:products/UI/screens/login_screen.dart';
import 'package:products/UI/size_config.dart';
import 'package:products/UI/theme.dart';
import 'package:products/UI/widgets/my_textbutton.dart';
import 'package:products/controller/web_services.dart';
import 'package:products/generated/l10n.dart';
import 'package:provider/provider.dart';

import '../../controller/provider.dart';
import '../widgets/my_elevated_button.dart';
import '../widgets/my_field.dart';

class RegisterScreen extends StatelessWidget {
  static const String route = 'Register';
  RegisterScreen({super.key});
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();

  TextEditingController phone = TextEditingController();
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
            s.Registeration,
            style: headingStyle,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  field(fullName, s.name,context),
                  field(
                    email,
                    s.Email,context
                  ),
                  field(phone, s.Phone,context),
                  field(
                    password,
                    s.Password,context,
                    isObsecure: true,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 6) {
                        return s.Please;
                      } else {
                        return null;
                      }
                    },
                  ),
                  sized(height: 10),
                  MyElevatedButton(
                    label: s.Register,
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        var respone = await WebServices().registration({
                          "email": email.text,
                          "username": fullName.text,
                          "password": password.text,
                          "phone": phone.text
                        });
                        if (respone is int) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        }
                      }
                    },
                  ),
                  sized(height: 10),
                  MyTextButton(
                    label: s.already,
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
