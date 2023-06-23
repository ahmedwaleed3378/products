import 'package:products/controller/api_requests.dart';

import 'models.dart';

String baseUrl = 'https://fakestoreapi.com';

class WebServices {
  Future<List<Product>> getProducts() async {
    List<dynamic> res = await ApiRequests().get(url: '$baseUrl/products');
    List<Product> products = res.map((e) => Product.fromJson(e)).toList();
    return products;
  }

  Future<dynamic> registration( Map<String, dynamic> body) async {
    Map<String, dynamic> res =
        await ApiRequests().post(url: '$baseUrl/users', body: body);
    return res['id'];
  }
}
