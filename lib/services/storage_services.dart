import 'package:get_storage/get_storage.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:thirumathikart_app/constants/storage_constants.dart';

class StorageServices extends GetxService {
  late GetStorage storage;

  Future<StorageServices> initStorage() async {
    await GetStorage.init();
    storage = GetStorage();
    return this;
  }

  Future<void> storeEvents(String res) async =>
      storage.write(StorageConstants.products, res);
  String? retriveEvents() => storage.read(StorageConstants.products);
}
