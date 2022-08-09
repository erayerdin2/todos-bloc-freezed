import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:todos_bloc_freezed/domains/shared/data/models/todo/todo.model.dart';
import 'package:todos_bloc_freezed/domains/shared/data/repository/todo/todo.repository.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository _todoRepository = GetIt.I.get();

  TodoBloc() : super(ProcessingTodoState()) {
    on<TodoEvent>((event, emit) async {
      emit(ProcessingTodoState());

      if (event is ListTodosEvent) {
        // if event is to list the todos
        final todos = await _todoRepository.list();
        emit(ListTodosState(todos: todos));
      } else if (event is CreateTodoEvent) {
        // if event is to create a new todo
        await _todoRepository.create(todo: event.todo);
        // reload the list so we can see the latest changes
        add(ListTodosEvent());
      }

      // but what if we add a new event to this?
      // dart compiler will not warn us about it
      // it will not say "hey, you have a new event and you didn't cover it."
      // we need to write a new "else if" in this case, and that is
      // if we remember to do it
    });
  }
}
