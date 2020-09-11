import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'interfaces/local_storage_hive_service_interface.dart';

part 'local_storage_shared_service.g.dart';

@Injectable()
class LocalStorageSharedService extends Disposable
    implements ILocalStorageHiveService {
  //dispose will be called automatically
  @override
  void dispose() {}

  Completer<SharedPreferences> _instance = Completer<SharedPreferences>();

  _init() async {
    var dir = await getApplicationDocumentsDirectory();
    _instance.complete(await SharedPreferences.getInstance());
  }

  LocalStorageSharedService() {
    _init();
  }

  @override
  Future delete(String key) async {
    // TODO: implement delete
    var share = await _instance.future;
     share.remove(key);
  }

  @override
  Future<List<String>> get(String key) async {
    // TODO: implement get
    var share = await _instance.future;
    return share.getStringList(key);
  }

  @override
  Future put(String key, List<String> value) async {
    // TODO: implement put
    var share = await _instance.future;
     share.setStringList(key, value);
  }
}
