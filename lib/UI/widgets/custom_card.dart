import 'package:flutter/material.dart';
import 'package:products/UI/screens/product_detail_screen.dart';
import 'package:products/UI/size_config.dart';
import 'package:products/UI/theme.dart';
import 'package:products/controller/models.dart';
import 'package:products/controller/provider.dart';
import 'package:provider/provider.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    required this.product,
    Key? key,
  }) : super(key: key);

  Product product;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var provider = Provider.of<AppProvider>(context, listen: false);
    return Hero(
      tag: product.id,
      child: GestureDetector(
        onTap: () {
          Provider.of<AppProvider>(context, listen: false).cuurentProduct =
              product;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProductDetailsScreen(),
            ),
          );
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  blurRadius: 50,
                  color: Colors.grey.withOpacity(.1),
                  spreadRadius: 20,
                  offset: const Offset(10, 10),
                ),
              ]),
              child: Card(
                color: provider.isLightTheme ? white : darkGreyClr,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 10,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title.substring(0, 6),
                        style: TextStyle(
                          color: provider.isLightTheme ? darkGreyClr : white,
                          fontSize: 16,
                        ),
                      ),
                      sized(height: 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            r'$' '${product.price.toString()}',
                            style: TextStyle(
                              fontSize: 16,
                              color:
                                  provider.isLightTheme ? darkGreyClr : white,
                            ),
                          ),
                          const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 32,
              top: -60,
              child: Image.network(
                product.image,
                height: 100,
                width: 100,
              ),
            )
          ],
        ),
      ),
    );
  }
}
