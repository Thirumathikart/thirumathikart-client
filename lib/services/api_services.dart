import 'package:get/get_connect/connect.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:thirumathikart_app/models/prodcut_response.dart';

class ApiServices extends GetxService {
  late ApiManager api;

  Future<ApiServices> initApi() async {
    api = ApiManager();
    return this;
  }
}

class ApiManager extends GetConnect {
  final headers = {
    'Accept': 'application/json',
    'Access-Control-Allow-Origin': '*',
  };
  Future<List<ProductResponse>> getProducts() async {
    try {
      final response = await get(
          'http://thirumathikart.nitt.edu:8000/products/',
          headers: headers);
      if (response.statusCode == 200 && response.bodyString != null) {
        final products = productResponseFromJson(response.bodyString!);
        return products;
      }
      return Future.error('Error');
    } catch (e) {
      return Future.error(e);
    }
  }
}
