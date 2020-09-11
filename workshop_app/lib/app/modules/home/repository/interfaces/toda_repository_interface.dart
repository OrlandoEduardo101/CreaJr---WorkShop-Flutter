import 'package:flutter_modular/flutter_modular.dart';
import 'package:workshop_app/app/modules/home/components/dota/hero_model.dart';

abstract class ITodaRepository implements Disposable {
  Future fetchPost();
  Future<List<HeroModel>> getHeros();
}
