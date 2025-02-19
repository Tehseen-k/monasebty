import 'package:get_it/get_it.dart';
import 'package:monasebty/core/services/api_services.dart';
import 'package:monasebty/core/services/auth_services.dart';
import 'package:monasebty/core/services/database_services.dart';
import 'package:monasebty/core/services/local_storage_services.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  locator.registerSingleton(AuthServices());
  locator.registerSingleton(LocalStorageService());
  locator.registerSingleton(DatabaseService());
  locator.registerSingleton(ApiServices());
}
