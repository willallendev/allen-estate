import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class TransitoryCacheManager extends BaseCacheManager {
  static const key = "transitoryCacheData";

  static TransitoryCacheManager _instance;

  factory TransitoryCacheManager() {
    if (_instance == null) {
      _instance = new TransitoryCacheManager._();
    }
    return _instance;
  }

  TransitoryCacheManager._() : super(key, maxAgeCacheObject: Duration(hours: 1), maxNrOfCacheObjects: 100);

  @override
  Future<String> getFilePath() async {
    var directory = await getTemporaryDirectory();
    return p.join(directory.path, key);
  }
}
