import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:workshop_app/app/modules/home/components/dota/hero_model.dart';
import 'package:workshop_app/app/shared/utils/constants.dart';

import 'interfaces/toda_repository_interface.dart';

part 'toda_repository.g.dart';

@Injectable()
class TodaRepository implements ITodaRepository {
  final Dio client;

  TodaRepository(this.client);

  Future fetchPost() async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future<List<HeroModel>> getHeros() async {
    var response = await client.get(url_base);
    List<HeroModel> list = [];
    debugPrint(response.data.toString());
    for (var item in response.data as List) {
      HeroModel model = HeroModel.fromJson(item);
      list.add(model);
    }

    return list;
  }
}
