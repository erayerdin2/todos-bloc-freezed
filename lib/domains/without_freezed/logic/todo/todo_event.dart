// Copyright 2022 Eray Erdin.
// Use of this source code is governed by the WTFPL
// license that can be found in the LICENSE file.

part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent extends Equatable {}

class ListTodosEvent extends TodoEvent {
  @override
  List<Object?> get props => [];
}

class CreateTodoEvent extends TodoEvent {
  final Todo todo;

  CreateTodoEvent({
    required this.todo,
  });

  @override
  List<Object?> get props => [todo];
}
