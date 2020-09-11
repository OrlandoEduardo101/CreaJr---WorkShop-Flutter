import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:workshop_app/app/modules/home/repository/interfaces/toda_repository_interface.dart';
import 'hero_model.dart';

part 'dota_controller.g.dart';

@Injectable()
class DotaController = _DotaControllerBase with _$DotaController;

abstract class _DotaControllerBase with Store {
  final ITodaRepository repository;

  @observable
  ObservableFuture<List<HeroModel>> listHero;

  _DotaControllerBase(this.repository) {
    getHeros();
  }

  @action
  void getHeros() {
    print('get hero');
    listHero = repository.getHeros().asObservable();
    print(' result ' + listHero.value.toString());
  }
}
