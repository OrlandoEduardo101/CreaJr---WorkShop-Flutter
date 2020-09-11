import 'services/localStorage/local_storage_shared_service.dart';
import 'package:hive/hive.dart';

import 'services/localStorage/local_storage_hive_service.dart';
import 'services/localStorage/local_storage_hive_service.dart';

import 'repository/dota_repository/dota_repository.dart';
import 'package:dio/dio.dart';
import 'components/todo/todo_controller.dart';
import 'components/dota/dota_controller.dart';
import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        //$LocalStorageSharedService,
        $LocalStorageHiveService,
        $LocalStorageHiveService,
        // Bind<IDotaRepository>((i) => DotaRepository(Dio())),
        Bind((i) => Dio()),
        //Bind((i) => Hive(i())),
        $DotaRepository,
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
