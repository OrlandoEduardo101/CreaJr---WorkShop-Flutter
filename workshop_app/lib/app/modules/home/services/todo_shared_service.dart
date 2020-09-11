import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workshop_app/app/modules/home/services/interfaces/todo_service_interface.dart';

part 'todo_shared_service.g.dart';

@Injectable()
class TodoSharedService extends Disposable implements ITodoService {
  //dispose will be called automatically

  Completer<SharedPreferences> _instance = Completer<SharedPreferences>();

  @override
  void dispose() {}

  _init() async {
    var dir = await getApplicationDocumentsDirectory();
    _instance.complete(await SharedPreferences.getInstance());
  }

  TodoSharedService() {
    _init();
  }

  @override
  Future delete(String key) async {
    var share = await _instance.future;
    share.remove(key);
    debugPrint('delete $key');
  }

  @override
  Future<List<String>> get(String key) async {
    var share = await _instance.future;
    debugPrint('get $key');
    return share.getStringList(key);
  }

  @override
  Future put(String key, List<String> value) async {
    var share = await _instance.future;
    share.setStringList(key, value);
    debugPrint('get shared $key');
  }
}
