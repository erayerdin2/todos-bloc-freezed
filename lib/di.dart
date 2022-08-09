// Copyright 2022 Eray Erdin.
// Use of this source code is governed by the WTFPL
// license that can be found in the LICENSE file.

import 'package:get_it/get_it.dart';
import 'package:todos_bloc_freezed/domains/shared/data/repository/todo/todo.repository.dart';

void setUpDI() {
  // Repositories
  GetIt.I.registerLazySingleton<TodoRepository>(() => DummyTodoRepository());
}
