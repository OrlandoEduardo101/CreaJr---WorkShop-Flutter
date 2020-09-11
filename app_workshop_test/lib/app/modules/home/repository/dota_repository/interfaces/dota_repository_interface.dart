import 'package:app_workshop/app/modules/home/components/dota/hero_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class IDotaRepository implements Disposable {
  Future fetchPost();

  Future<List<HeroModel>> getHeros();
}
