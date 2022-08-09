part of 'todo_bloc.dart';

@freezed
class TodoEvent with _$TodoEvent {
  const factory TodoEvent.list() = _ListTodosEvent;
  const factory TodoEvent.create({required Todo todo}) = _CreateTodoEvent;
  const factory TodoEvent.delete({required Todo todo}) = _DeleteTodoEvent;
}
