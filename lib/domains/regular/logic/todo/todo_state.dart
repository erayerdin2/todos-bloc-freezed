// Copyright 2022 Eray Erdin.
// Use of this source code is governed by the WTFPL
// license that can be found in the LICENSE file.

part of 'todo_bloc.dart';

@immutable
abstract class TodoState extends Equatable {}

class ProcessingTodoState extends TodoState {
  @override
  List<Object?> get props => [];
}

class ListTodosState extends TodoState {
  final Iterable<Todo> todos;

  ListTodosState({
    required this.todos,
  });

  @override
  List<Object?> get props => [todos];
}
