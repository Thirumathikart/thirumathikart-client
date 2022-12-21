import 'package:get/get_connect/connect.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:thirumathikart_app/constants/api_constants.dart';
import 'package:thirumathikart_app/constants/product_constants.dart';
import 'package:thirumathikart_app/models/add_address_request.dart';
import 'package:thirumathikart_app/models/add_address_response.dart';
import 'package:thirumathikart_app/models/fetch_address_response.dart';
import 'package:thirumathikart_app/models/fetch_order_response.dart';
import 'package:thirumathikart_app/models/order_request.dart';
import 'package:thirumathikart_app/models/order_response.dart';
import 'package:thirumathikart_app/models/prodcut_response.dart';
import 'package:thirumathikart_app/models/update_address_request.dart';
import 'package:thirumathikart_app/models/update_address_response.dart';
import 'package:thirumathikart_app/services/storage_services.dart';
import 'package:thirumathikart_app/models/login_request.dart';
import 'package:thirumathikart_app/models/login_response.dart';
import 'package:thirumathikart_app/models/register_request.dart';
import 'package:thirumathikart_app/models/register_response.dart';

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
      final cache = storageServices.retriveProducts();
      final response = await get(
          '${ApiConstants.productsByCatergory}?category=${ProductConstants.categoryMap[category]}');
      if (response.statusCode == 200 && response.bodyString != null) {
        storageServices
            .storeProdcuts({category: response.bodyString!}, category);
        final products = productResponseFromJson(response.bodyString!);
        return products;
      } else {
        if (cache![category] != null) {
          final productsFromCache = productResponseFromJson(cache[category]!);
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

  Future<LoginResponse> loginCutomer(
      LoginRequest request, StorageServices storageServices) async {
    try {
      final response =
          await post(ApiConstants.login, request.toJson(), headers: headers);

      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        if (response.statusCode == 200 && response.bodyString != null) {
          var loginResponse = loginResponseFromJson(response.bodyString!);
          if (loginResponse.message == 'User Authenticated Successfully') {
            await storageServices.storeUser(loginResponse.token);
            return loginResponse;
          }
        }
        return Future.error('Unable To Login User');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<RegistrationResponse> registerCutomer(
      RegistrationRequest request) async {
    try {
      final response = await post(
          ApiConstants.register, registrationRequestToJson(request),
          headers: headers);

      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        if (response.statusCode == 200 && response.bodyString != null) {
          var registerResponse =
              registrationResponseFromJson(response.bodyString!);
          return registerResponse;
        }
        return Future.error('Unable To Register User');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<OrderResponse> createOrder(
      OrderRequest request, StorageServices storageServices) async {
    try {
      var jwt = storageServices.getUser();
      var headers = {
        'Accept': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Authorization': jwt!
      };
      final response =
          await post(ApiConstants.orderUrl, request.toJson(), headers: headers);
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        if (response.statusCode == 200 && response.bodyString != null) {
          var orderResponse = orderResponseFromJson(response.bodyString!);
          if (orderResponse.response == 'Order Placed Successfully') {
            return orderResponse;
          }
        }
        return Future.error('Unable To Place Order');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<FetchAddressResponse> fetchAddress(
      StorageServices storageServices) async {
    try {
      var jwt = storageServices.getUser();
      var headers = {
        'Accept': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Authorization': jwt!
      };
      final response = await get(ApiConstants.fetchAddress, headers: headers);
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        if (response.statusCode == 200 && response.bodyString != null) {
          var fetchAddressResponse =
              fetchAddressResponseFromJson(response.bodyString!);
          if (fetchAddressResponse.message == 'success') {
            return fetchAddressResponse;
          }
        }
        return Future.error('Unable To Fetch Address');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<FetchOrderResponse> fetchProduct(
      StorageServices storageServices) async {
    try {
      var jwt = storageServices.getUser();
      var headers = {
        'Accept': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Authorization': jwt!
      };
      final response = await get(ApiConstants.fetchProduct, headers: headers);
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        if (response.statusCode == 200 && response.bodyString != null) {
          var fetchOrderResponse =
              fetchorderResponseFromJson(response.bodyString!);
          if (fetchOrderResponse.message == 'success') {
            return fetchOrderResponse;
          }
        }
        return Future.error('Unable To Fetch Product');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<AddAddressResponse> addAddress(
      AddAddressRequest request, StorageServices storageServices) async {
    try {
      var jwt = storageServices.getUser();
      var headers = {
        'Accept': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Authorization': jwt!
      };
      final response = await post(ApiConstants.addAddress, request.toJson(),
          headers: headers);
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        if (response.statusCode == 200 && response.bodyString != null) {
          var addAddressResponse =
              addAddressResponseFromJson(response.bodyString!);
          if (addAddressResponse.message == 'success') {
            return addAddressResponse;
          }
        }
        return Future.error('Unable To Add Address');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<UpdateAddressResponse> updateAddress(
      UpdateAddressRequest request, StorageServices storageServices) async {
    try {
      var jwt = storageServices.getUser();
      var headers = {
        'Accept': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Authorization': jwt!
      };
      final response = await post(ApiConstants.updateAddress, request.toJson(),
          headers: headers);
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        if (response.statusCode == 200 && response.bodyString != null) {
          var updateAddressResponse =
              updateAddressResponseFromJson(response.bodyString!);
          if (updateAddressResponse.message == 'success') {
            return updateAddressResponse;
          }
        }
        return Future.error('Unable To Update Address');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
