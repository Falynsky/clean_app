class WidgetBuildCounterUtils {
  static final Map<String, int> _cache = <String, int>{};
  static final Map<String, String> _cacheDescription = <String, String>{};

  factory WidgetBuildCounterUtils() {
    return _instance ??= WidgetBuildCounterUtils._internal();
  }

  WidgetBuildCounterUtils._internal();

  static WidgetBuildCounterUtils? _instance;

  void start({required String key, String? description}) {
    _cache[key] = 0;
    _cacheDescription[key] = description ?? key;
  }

  void add({required String key}) {
    _cache[key] = (_cache[key] ?? 0) + 1;
  }


  int? get({required String key}) {
    final int? builds = _cache[key];
    if (builds == null) {
      return null;
    }
    final String description = _cacheDescription[key] ?? 'test';
    print('$description $builds times');
    return builds;
  }

  int? stop({required String key}) {
    final int? builds = _cache.remove(key);
    if (builds == null) {
      return null;
    }
    final String description = _cacheDescription[key] ?? 'test';
    print('$description $builds times');
    return builds;
  }
}
