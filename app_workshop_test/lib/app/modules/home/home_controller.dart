import 'package:app_workshop/app/modules/home/repository/dota_repository/interfaces/dota_repository_interface.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  /*final IDotaRepository repository;
  _HomeControllerBase(this.repository);*/
  
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
    print(value);
  }
}
