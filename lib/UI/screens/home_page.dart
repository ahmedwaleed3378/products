import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:products/UI/size_config.dart';
import 'package:products/controller/provider.dart';
import 'package:products/controller/web_services.dart';
import 'package:products/generated/l10n.dart';
import 'package:provider/provider.dart';

import '../../controller/models.dart';
import '../theme.dart';
import '../widgets/custom_card.dart';
import '../widgets/indicator.dart';
import '../widgets/my_drawer.dart';
import '../widgets/no_connection.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String route = '/home';
  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var provider = Provider.of<AppProvider>(context);
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: provider.isLightTheme ? white : darkGreyClr,
      appBar: AppBar(
        toolbarHeight: SizeConfig.orientation == Orientation.portrait
            ? SizeConfig.screenHeight * 0.07
            : SizeConfig.screenHeight * 0.12,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: prmClr,
          statusBarBrightness:
              provider.isLightTheme ? Brightness.light : Brightness.dark,
          statusBarIconBrightness:
              provider.isLightTheme ? Brightness.light : Brightness.dark,
        ),
        actions: [
          IconButton(
              onPressed: () {
                provider.changeTheme();
              },
              icon: Icon(
                provider.isLightTheme
                    ? Icons.dark_mode_outlined
                    : Icons.light_mode,
                color: provider.isLightTheme ? white : darkGreyClr,
              )),
        ],
        primary: false,
        title: Text(
          s.Home,
          style: subheadingStyle.copyWith(
              color: provider.isLightTheme ? white : darkGreyClr),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: prmClr,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                color: Provider.of<AppProvider>(context).isLightTheme
                    ? white
                    : darkGreyClr,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      drawer: MyDrawer(s: s, provider: provider),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;

          if (connected) {
            return SizeConfig.orientation == Orientation.portrait
                ? Container(
                    margin: EdgeInsets.only(top: SizeConfig.screenHeight * 0.1),
                    child: FutureBuilder<List<Product>>(
                      future: WebServices().getProducts(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Product> products = snapshot.data!;
                          return GridView.builder(
                              itemCount: products.length,
                              clipBehavior: Clip.none,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1.5,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: SizeConfig.screenHeight * 0.1,
                              ),
                              itemBuilder: (context, index) {
                                return CustomCard(product: products[index]);
                              });
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  )
                : Container(
                    margin:
                        EdgeInsets.only(top: SizeConfig.screenHeight * 0.27),
                    child: FutureBuilder<List<Product>>(
                      future: WebServices().getProducts(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Product> products = snapshot.data!;
                          return GridView.builder(
                              itemCount: products.length,
                              clipBehavior: Clip.none,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 1.5,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: SizeConfig.screenHeight * 0.18,
                              ),
                              itemBuilder: (context, index) {
                                return CustomCard(product: products[index]);
                              });
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  );
          } else {
            return buildNoInternetWidget(context);
          }
        },
        child: showLoadingIndicator(),
      ),
    );
  }
}
