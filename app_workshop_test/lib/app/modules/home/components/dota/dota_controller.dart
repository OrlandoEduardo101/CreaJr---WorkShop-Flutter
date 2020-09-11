import 'package:app_workshop/app/modules/home/repository/dota_repository/interfaces/dota_repository_interface.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'hero_model.dart';

part 'dota_controller.g.dart';

@Injectable()
class DotaController = _DotaControllerBase with _$DotaController;

abstract class _DotaControllerBase with Store {
  final IDotaRepository repository;

  _DotaControllerBase(this.repository) {
    getHeros();
  }

  @observable
  ObservableFuture<List<HeroModel>> listHeroes;

  @action
  void getHeros() {
    listHeroes = repository.getHeros().asObservable();
    print("result" + listHeroes.value.toString());
  }
}
