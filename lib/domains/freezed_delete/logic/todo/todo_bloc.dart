import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:todos_bloc_freezed/domains/shared/data/models/todo/todo.model.dart';
import 'package:todos_bloc_freezed/domains/shared/data/repository/todo/todo.repository.dart';

part 'todo_bloc.freezed.dart';
part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository _todoRepository = GetIt.I.get();

  TodoBloc() : super(const TodoState.processing()) {
    on<TodoEvent>((event, emit) async {
      // if we add a new event, event.map method
      // will warn us with a compile error
      // so we won't have unhandled cases
      emit(const TodoState.processing());

      await event.map(
        // if the event is to list todos
        list: (event) async {
          final todos = await _todoRepository.list();
          emit(TodoState.list(todos: todos));
        },
        // if the event is to create a new todo
        create: (event) async {
          await _todoRepository.create(todo: event.todo);
          // add list event so it can go back to
          // the beginning of this whole method
          add(const TodoEvent.list());
        },
        // if the event is to delete a todo
        delete: (event) async {
          await _todoRepository.delete(todo: event.todo);
          add(const TodoEvent.list());
        },
      );
    });
  }
}
