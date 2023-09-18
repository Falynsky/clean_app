class StopwatchUtils {
  static final Map<String, Stopwatch> _cache = <String, Stopwatch>{};
  static final Map<String, String> _cacheDescription = <String, String>{};

  factory StopwatchUtils() {
    return _instance ??= StopwatchUtils._internal();
  }

  StopwatchUtils._internal();

  static StopwatchUtils? _instance;

  void start({required String key, String? description}) {
    _cache[key] = Stopwatch()..start();
    _cacheDescription[key] = description ?? key;
  }

  int? stop({required String key}) {
    final Stopwatch? stopwatch = _cache.remove(key);
    if (stopwatch == null) {
      return null;
    }
    final String description = _cacheDescription.remove(key) ?? 'test';
    final int elapsedMilliseconds = stopwatch.elapsedMilliseconds;
    final int elapsedMicroseconds = stopwatch.elapsedMicroseconds;
    print('$description $elapsedMilliseconds ms / $elapsedMicroseconds μs');
    return elapsedMilliseconds;
  }
}
