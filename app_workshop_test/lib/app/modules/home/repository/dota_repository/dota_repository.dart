import 'dart:convert';

import 'package:app_workshop/app/modules/home/components/dota/hero_model.dart';
import 'package:app_workshop/app/share/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

import 'interfaces/dota_repository_interface.dart';

part 'dota_repository.g.dart';

@Injectable()
class DotaRepository implements IDotaRepository {
  //final Dio client;
  final Dio client;

  DotaRepository(this.client);

  Future fetchPost() async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response;
  }

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future<List<HeroModel>> getHeros() async {
    var response = await client.get(URL_BASE + "/heroStats");

    print(response.statusCode);

    //var decode = jsonDecode(response.data);

    print(response.data);

    List<HeroModel> list = [];

    for(var json in response.data as List){
      HeroModel model = HeroModel.fromJson(json);
      list.add(model);
    }

    //HeroModel hero = response

    return list;
  }
}
