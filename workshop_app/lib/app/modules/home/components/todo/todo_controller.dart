import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:workshop_app/app/modules/home/services/interfaces/todo_service_interface.dart';

part 'todo_controller.g.dart';

@Injectable()
class TodoController = _TodoControllerBase with _$TodoController;

abstract class _TodoControllerBase with Store {
  final ITodoService storage = Modular.get();
  _TodoControllerBase();

  @observable
  String text = '';

  @action
  String setText(value) => text = value;

  @observable
  ObservableList<String> list = <String>[].asObservable();

  @action
  init() async {
    List<String> listLocal = await storage.get('list');
    if (listLocal == null) {
      list = <String>[].asObservable();
    } else {
      list = listLocal.asObservable();
    }
  }

  @action
  void save() {
    list.add(text);
    debugPrint(list[0].toString());
    storage.put('list', list);
  }
  @action
  void remove(int index) {
    list.removeAt(index);
    debugPrint(list[0].toString());
    storage.put('list', list);
  }
  
}
