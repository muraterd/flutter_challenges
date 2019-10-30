import 'package:mobx/mobx.dart';
import 'package:todo_app/models/ToDoItemModel.dart';

// Include generated file
part 'AppStore.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  @observable
  String appName = 'Test22';

  @observable
  ObservableList<ToDoItemModel> tasks = ObservableList<ToDoItemModel>();

  _AppStore() {
    tasks.add(ToDoItemModel(text: 'Mobx Test', isCompleted: false));
  }

  @action
  void setAsCompleted() {
    // tasks[0].isCompleted = true;
    for (var task in tasks) {
      task.isCompleted = true;
    }
  }

  @action
  void changeName(String name) {
    appName = name;
  }
}

final appStoreInstance = new AppStore();

// Source Code Generate
// flutter packages pub run build_runner watch --delete-conflicting-outputs

// Observing the value
// Observer(
//   builder: (_) => Title(text: appStoreInstance.appName),
// )
