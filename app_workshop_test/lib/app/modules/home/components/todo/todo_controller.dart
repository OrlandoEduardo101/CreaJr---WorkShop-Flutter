import 'package:app_workshop/app/modules/home/services/localStorage/interfaces/local_storage_hive_service_interface.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'todo_controller.g.dart';

@Injectable()
class TodoController = _TodoControllerBase with _$TodoController;

abstract class _TodoControllerBase with Store {
  final ILocalStorageHiveService _storage = Modular.get();

  _TodoControllerBase() {
    init();
  }

  @observable
  String text = '';

  @action
  setText(String value) => text = value;

  @observable
  ObservableList<String> list = <String>[].asObservable();

  @action
  init() async {
    List<String> listLocal = await _storage.get('list');
    if (listLocal == null) {
      list = <String>[].asObservable();
    } else {
      list = listLocal.asObservable();
    }
  }

  @action
  void save() {
    list.add(text);
    print(list[0].toString());
    _storage.put('list', list);
  }

  void remove(int index) {
    list.removeAt(index);
    _storage.put('list', list);
  }


}
