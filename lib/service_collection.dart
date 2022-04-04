import 'package:get_it/get_it.dart';
import 'package:kalyana_gadiya/api/core/core.dart';
import 'package:kalyana_gadiya/core/cache.dart';
import 'package:kalyana_gadiya/core/storage.dart';

class ServiceCollection {
  void registerServices() {
    GetIt getIt = GetIt.instance;
    getIt.registerLazySingleton<ICache>(() => InMemoryCache());
    getIt.registerLazySingleton<IStorageAdapter>(() => LocalStorageAdapter());
    getIt.registerLazySingleton<IHttpAdapter>(() => HttpAdapter());
  }
}
