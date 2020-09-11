import 'services/todo_shared_service.dart';
import 'components/todo/item/item_controller.dart';
import 'services/todo_hive_service.dart';
import 'package:dio/dio.dart';
import 'repository/toda_repository.dart';
import 'components/todo/todo_controller.dart';
import 'components/dota/dota_controller.dart';
import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $TodoSharedService,
        $TodoSharedService,
        //$TodoHiveService,
        //$TodoHiveService,
        $ItemController,
        Bind((i) => Dio()),
        $TodaRepository,
        $TodoController,
        $DotaController,
        $HomeController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
