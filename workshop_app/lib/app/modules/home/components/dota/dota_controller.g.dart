// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dota_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $DotaController = BindInject(
  (i) => DotaController(i<ITodaRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DotaController on _DotaControllerBase, Store {
  final _$listHeroAtom = Atom(name: '_DotaControllerBase.listHero');

  @override
  ObservableFuture<List<HeroModel>> get listHero {
    _$listHeroAtom.reportRead();
    return super.listHero;
  }

  @override
  set listHero(ObservableFuture<List<HeroModel>> value) {
    _$listHeroAtom.reportWrite(value, super.listHero, () {
      super.listHero = value;
    });
  }

  final _$_DotaControllerBaseActionController =
      ActionController(name: '_DotaControllerBase');

  @override
  void getHeros() {
    final _$actionInfo = _$_DotaControllerBaseActionController.startAction(
        name: '_DotaControllerBase.getHeros');
    try {
      return super.getHeros();
    } finally {
      _$_DotaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listHero: ${listHero}
    ''';
  }
}
