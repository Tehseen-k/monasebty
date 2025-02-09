import 'package:get_it/get_it.dart';
import 'package:monasebty/core/services/api_services.dart';
import 'package:monasebty/core/services/auth_services.dart';
import 'package:monasebty/core/services/database_services.dart';
import 'package:monasebty/core/services/local_storage_services.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  // final _instance = await LocalStorageService.getInstance();
  // locator.registerSingleton(_instance);
  locator.registerSingleton(AuthServices());
  locator.registerSingleton(LocalStorageService());
  // locator.registerSingleton(NotificationsService());
  locator.registerSingleton(DatabaseService());
  locator.registerSingleton(ApiServices());
  // locator.registerLazySingleton(() => FilePickerService());
}
