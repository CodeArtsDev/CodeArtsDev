abstract class ICache {
  Future set(String key, dynamic data);
  Future<T?> get<T>(String key);
  Future<bool> clear(String key);
}

class InMemoryCache implements ICache {
  final Map<String, dynamic> _cache = <String, dynamic>{};

  Future set(String key, dynamic data) async {
    _cache[key] = data;
  }

  @override
  Future<T?> get<T>(String key) async {
    return _cache[key];
  }

  @override
  Future<bool> clear(String key) async {
    _cache.remove(key);
    return true;
  }
}
