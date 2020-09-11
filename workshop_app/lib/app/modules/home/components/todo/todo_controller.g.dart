// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $TodoController = BindInject(
  (i) => TodoController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodoController on _TodoControllerBase, Store {
  final _$textAtom = Atom(name: '_TodoControllerBase.text');

  @override
  String get text {
    _$textAtom.reportRead();
    return super.text;
  }

  @override
  set text(String value) {
    _$textAtom.reportWrite(value, super.text, () {
      super.text = value;
    });
  }

  final _$listAtom = Atom(name: '_TodoControllerBase.list');

  @override
  ObservableList<String> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(ObservableList<String> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_TodoControllerBase.init');

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$_TodoControllerBaseActionController =
      ActionController(name: '_TodoControllerBase');

  @override
  String setText(dynamic value) {
    final _$actionInfo = _$_TodoControllerBaseActionController.startAction(
        name: '_TodoControllerBase.setText');
    try {
      return super.setText(value);
    } finally {
      _$_TodoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void save() {
    final _$actionInfo = _$_TodoControllerBaseActionController.startAction(
        name: '_TodoControllerBase.save');
    try {
      return super.save();
    } finally {
      _$_TodoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove(int index) {
    final _$actionInfo = _$_TodoControllerBaseActionController.startAction(
        name: '_TodoControllerBase.remove');
    try {
      return super.remove(index);
    } finally {
      _$_TodoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
text: ${text},
list: ${list}
    ''';
  }
}
