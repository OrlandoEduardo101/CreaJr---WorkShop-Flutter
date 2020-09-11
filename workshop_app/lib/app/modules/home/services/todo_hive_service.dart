import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'interfaces/todo_service_interface.dart';

part 'todo_hive_service.g.dart';

@Injectable()
class TodoHiveService implements ITodoService {
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

  TodoService() {
    _init();
  }

  @override
  Future delete(String key) async {
    var box = await _instance.future;
    box.delete(key);
    debugPrint('delete $key');
  }

  @override
  Future<List<String>> get(String key) async {
    var box = await _instance.future;
    box.get(key);
    debugPrint('get $key');
  }

  @override
  Future put(String key, List<String> value) async {
    var box = await _instance.future;
    box.put(key, value);
    debugPrint('save hive $key $value');
  }
}
