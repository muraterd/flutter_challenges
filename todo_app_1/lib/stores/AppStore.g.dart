// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppStore on _AppStore, Store {
  final _$appNameAtom = Atom(name: '_AppStore.appName');

  @override
  String get appName {
    _$appNameAtom.context.enforceReadPolicy(_$appNameAtom);
    _$appNameAtom.reportObserved();
    return super.appName;
  }

  @override
  set appName(String value) {
    _$appNameAtom.context.conditionallyRunInAction(() {
      super.appName = value;
      _$appNameAtom.reportChanged();
    }, _$appNameAtom, name: '${_$appNameAtom.name}_set');
  }

  final _$tasksAtom = Atom(name: '_AppStore.tasks');

  @override
  ObservableList<ToDoItemModel> get tasks {
    _$tasksAtom.context.enforceReadPolicy(_$tasksAtom);
    _$tasksAtom.reportObserved();
    return super.tasks;
  }

  @override
  set tasks(ObservableList<ToDoItemModel> value) {
    _$tasksAtom.context.conditionallyRunInAction(() {
      super.tasks = value;
      _$tasksAtom.reportChanged();
    }, _$tasksAtom, name: '${_$tasksAtom.name}_set');
  }

  final _$_AppStoreActionController = ActionController(name: '_AppStore');

  @override
  void setAsCompleted() {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.setAsCompleted();
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeName(String name) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.changeName(name);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }
}
