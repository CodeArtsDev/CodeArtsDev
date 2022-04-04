import 'package:get_it/get_it.dart';
import 'package:kalyana_gadiya/core/constants.dart';

import '../../core/cache.dart';
import '../../core/storage.dart';
import 'core.dart';

class TokenProvider {
  late ICache _cache;
  late IStorageAdapter _storageAdapter;
  late IHttpAdapter _httpAdapter;

  TokenProvider(
      {IStorageAdapter? storageAdapter,
      ICache? cache,
      IHttpAdapter? httpAdapter}) {
    _httpAdapter = httpAdapter ?? GetIt.instance<IHttpAdapter>();
    _storageAdapter = storageAdapter ?? GetIt.instance<IStorageAdapter>();
    _cache = cache ?? GetIt.instance<ICache>();
  }

  Future<String> get() async {
    var tokenKey = AppConstants.cache.apiToken;
    var token = await _cache.get<String>(tokenKey) ??
        (await _storageAdapter.get<String>(tokenKey));

    if (token == null) {
      token = await _getToken();
      await _storageAdapter.set(tokenKey, token);
      await _cache.set(tokenKey, token);
    }

    return token;
  }

  Future<String> _getToken() async {
    var token =
        Future.delayed(const Duration(seconds: 1), () => "sample token");
    return token;
  }
}
