import 'package:flutter/material.dart';
import 'package:products/UI/size_config.dart';
import 'package:products/UI/theme.dart';
import 'package:products/controller/provider.dart';
import 'package:provider/provider.dart';

import '../../generated/l10n.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  Widget productInfo(String title, String value, bool theme) {
    return RichText(
      maxLines: 5,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: theme ? darkGreyClr : white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: theme ? darkGreyClr : white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSliverAppBar(BuildContext context) {
    var provider = Provider.of<AppProvider>(context, listen: false);
    return SliverAppBar(
      toolbarHeight: SizeConfig.screenHeight*0.1,
      expandedHeight:SizeConfig.orientation == Orientation.portrait
            ?SizeConfig.screenHeight*0.6
            : SizeConfig.screenHeight * 0.4, 
      collapsedHeight:SizeConfig.screenHeight*0.1 ,
      pinned: true,
      stretch: true,
      backgroundColor: provider.isLightTheme ? white : darkGreyClr,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          provider.cuurentProduct.title,
          textAlign: TextAlign.center,
          style: titleStyle.copyWith(color: prmClr),
        ),
        background: Hero(
          transitionOnUserGestures: true,
          tag: provider.cuurentProduct.id,
          child: Image.network(
            provider.cuurentProduct.image,
            fit:SizeConfig.orientation == Orientation.portrait
            ?  BoxFit.fill:BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    SizeConfig().init(context);
    var provider = Provider.of<AppProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: provider.isLightTheme ? white : darkGreyClr,
      body: CustomScrollView(slivers: [
        buildSliverAppBar(context),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.03,
                  vertical: SizeConfig.screenHeight * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  productInfo(s.Category, provider.cuurentProduct.category,
                      provider.isLightTheme),
                  sized(
                    height: SizeConfig.screenHeight * 0.02,
                  ),
                  productInfo(
                      s.price,
                      provider.cuurentProduct.price.toString(),
                      provider.isLightTheme),
                  sized(
                    height: SizeConfig.screenHeight * 0.02,
                  ),
                  productInfo(
                      s.Description,
                      provider.cuurentProduct.description,
                      provider.isLightTheme),
                  sized(height: SizeConfig.screenHeight*0.5)
                ],
              ))
        ])),
      ]),
    );
  }
}
