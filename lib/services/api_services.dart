import 'package:get/get_connect/connect.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:thirumathikart_app/constants/api_constants.dart';
import 'package:thirumathikart_app/models/prodcut_response.dart';
import 'package:thirumathikart_app/services/storage_services.dart';

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
  Future<List<ProductResponse>> getProductsByCategory(
      StorageServices storageServices, String category) async {
    try {
      final cache = storageServices.retriveEvents();
      final response = await get(
          '${ApiConstants.baseUrl}${ApiConstants.products}/$category',
          headers: headers);
      if (response.statusCode == 200 && response.bodyString != null) {
        storageServices.storeEvents(response.bodyString!);
        final products = productResponseFromJson(response.bodyString!);
        return products;
      } else {
        if (cache != null) {
          final productsFromCache = productResponseFromJson(cache);
          return productsFromCache;
        } else {
          Future.error('Failed to load products');
        }
      }
      return Future.error('Failed to load products');
    } catch (e) {
      return Future.error('Error occurred while fetching products');
    }
  }
}
