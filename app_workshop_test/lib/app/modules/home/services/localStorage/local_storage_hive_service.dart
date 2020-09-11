import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'interfaces/local_storage_hive_service_interface.dart';

part 'local_storage_hive_service.g.dart';

@Injectable()
class LocalStorageHiveService implements ILocalStorageHiveService {
  //dispose will be called automatically
  @override
  void dispose() {}

  Completer<Box> _instance = Completer<Box>();

  _init() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    var box = await Hive.openBox('db');
    _instance.complete(box);
  }

  LocalStorageHiveService() {
    _init();
  }

  @override
  Future delete(String key) async {
    var box = await _instance.future;
    box.delete(key);
  }

  @override
  Future<List<String>> get(String key) async {
    var box = await _instance.future;
    return box.get(key);
  }

  @override
  Future put(String key, List<String> value) async {
    var box = await _instance.future;
    box.put(key, value);
    print("save $key $value");
  }
}
