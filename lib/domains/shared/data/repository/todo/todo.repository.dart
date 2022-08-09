// Copyright 2022 Eray Erdin.
// Use of this source code is governed by the WTFPL
// license that can be found in the LICENSE file.

import 'package:todos_bloc_freezed/domains/shared/data/models/todo/todo.model.dart';

// a fake wait in seconds to simulate waiting
const _fakeWaitSeconds = 1;

abstract class TodoRepository {
  Future<Iterable<Todo>> list();
  Future<void> create({required Todo todo});
  Future<void> delete({required Todo todo});
}

class DummyTodoRepository extends TodoRepository {
  final List<Todo> _todos = [];

  @override
  Future<void> create({required Todo todo}) async {
    // fake wait
    await Future.delayed(const Duration(seconds: _fakeWaitSeconds));
    _todos.add(todo);
  }

  @override
  Future<Iterable<Todo>> list() async {
    // fake wait
    await Future.delayed(const Duration(seconds: _fakeWaitSeconds));
    return _todos;
  }

  @override
  Future<void> delete({required Todo todo}) async {
    // fake wait
    await Future.delayed(const Duration(seconds: _fakeWaitSeconds));
    _todos.remove(todo);
  }
}
