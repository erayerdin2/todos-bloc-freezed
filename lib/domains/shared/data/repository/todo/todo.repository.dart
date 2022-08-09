// Copyright 2022 Eray Erdin.
// Use of this source code is governed by the WTFPL
// license that can be found in the LICENSE file.

import 'package:todos_bloc_freezed/domains/shared/data/models/todo/todo.model.dart';

abstract class TodoRepository {
  Future<Iterable<Todo>> list();
  Future<void> create({required Todo todo});
}

class DummyTodoRepository extends TodoRepository {
  final List<Todo> _todos = [];

  @override
  Future<void> create({required Todo todo}) async {
    // fake wait
    await Future.delayed(const Duration(seconds: 2));
    _todos.add(todo);
  }

  @override
  Future<Iterable<Todo>> list() async {
    // fake wait
    await Future.delayed(const Duration(seconds: 2));
    return _todos;
  }
}
