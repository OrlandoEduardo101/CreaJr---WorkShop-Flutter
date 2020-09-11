import 'package:app_workshop/app/modules/home/components/dota/dota_controller.dart';
import 'package:app_workshop/app/modules/home/components/dota/hero_model.dart';
import 'package:app_workshop/app/modules/home/repository/dota_repository/dota_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DotaWidget extends StatelessWidget {
  DotaController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (controller.listHeroes.value == null) {
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              Text('Loadings...'),
            ],
          ),
        );
      }
      if (controller.listHeroes.error != null) {
        return Center(
          child: Column(
            children: [
              Text("Error: " + controller.listHeroes.error.toString()),
              FlatButton(
                child: Text("Tente novamente"),
                onPressed: controller.getHeros,
              )
            ],
          ),
        );
      } else {
        return Container(
          padding: EdgeInsets.only(top: 0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                padding: EdgeInsets.only(top: 0),
                itemCount: controller.listHeroes.value.length,
                itemBuilder: (context, index) {
                  HeroModel hero = controller.listHeroes.value[index];
                  return Card(
                    child: SizedBox(
                      height: 80,
                      child: ListTile(
                        contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                        leading: CircleAvatar(
                          maxRadius: 30,
                          backgroundColor: Colors.grey,
                          backgroundImage: hero.img != null
                              ? NetworkImage(
                                  "https://steamcdn-a.akamaihd.net/" + hero.img)
                              : null,
                        ),
                        title: Text(
                          hero.localizedName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        subtitle: Text(
                          "id: ${hero.heroId}   ProWin: ${hero.proWin} \nProPick: ${hero.proPick}  ProBan: ${hero.proBan}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        );
      }
    });
  }
}
