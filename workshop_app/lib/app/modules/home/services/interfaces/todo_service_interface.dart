import 'package:flutter_modular/flutter_modular.dart';

abstract class ITodoService implements Disposable {
  Future<List<String>> get(String key);
  Future put(String key, List<String> value);
  Future delete(String key);
}
