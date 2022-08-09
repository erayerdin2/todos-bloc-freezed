// Copyright 2022 Eray Erdin.
// Use of this source code is governed by the WTFPL
// license that can be found in the LICENSE file.
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_bloc_freezed/domains/regular/logic/todo/todo_bloc.dart';
import 'package:todos_bloc_freezed/domains/shared/data/models/todo/todo.model.dart';
import 'package:todos_bloc_freezed/domains/shared/presentation/components/todo_card/todo_card.component.dart';

class ListTodosPage extends StatelessWidget {
  const ListTodosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TodoBloc()..add(ListTodosEvent()))
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('List Todos'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<TodoBloc, TodoState>(
            builder: (context, state) {
              if (state is ListTodosState) {
                // Iterable<Todo> to List<Todo>
                final todos = state.todos.toList();

                return todos.isEmpty
                    ? const Center(
                        child: Text('No todos found.'),
                      )
                    : ListView.separated(
                        itemBuilder: (context, index) =>
                            TodoCardComponent(todo: todos[index]),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 8),
                        itemCount: todos.length,
                      );
              }

              // this is valid if state is ProcessingTodoState
              // but what if we add a new state
              // dart compiler will not warn us if we add a new state
              // if we don't remember to cover that state,
              // then we will get unhandled cases, unexpected behavior
              // ergo: possible bugs
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
        floatingActionButton: Builder(
            builder: (context) => FloatingActionButton(
                  onPressed: () async {
                    // get the content
                    final content = await Navigator.of(context)
                        .pushNamed('/regular/create');

                    if (content == null) {
                      // if the content is null, show a message

                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('You have cancelled the operation'),
                        ),
                      );
                    } else {
                      // if not, create new todo

                      final todo = Todo(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        content: content as String,
                      );

                      // push the create event to the bloc
                      // ignore: use_build_context_synchronously
                      final TodoBloc bloc = context.read();
                      bloc.add(CreateTodoEvent(todo: todo));
                    }
                  },
                  child: const Icon(Icons.add),
                )),
      ),
    );
  }
}
