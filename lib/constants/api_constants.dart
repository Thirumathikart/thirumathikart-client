class ApiConstants {
  static String baseUrl = 'https://thirumathikart.nitt.edu/api/auth';
  static String productBaseUrl = 'https://thirumathikart.nitt.edu/api/product';
  static String orderUrl =
      'https://thirumathikart.nitt.edu/api/order/create_order';

  static String register = '$baseUrl/api/user/signup';
  static String login = '$baseUrl/api/user/loginCustomer';
  static String productsByCatergory =
      '$productBaseUrl/list_products_by_category';
  static String updateAddress = '$baseUrl/api/user/updateAddress';
  static String addAddress = '$baseUrl/api/user/addAddress';
  static String fetchAddress = '$baseUrl/api/user/address';
}
