// Copyright 2022 Eray Erdin.
// Use of this source code is governed by the WTFPL
// license that can be found in the LICENSE file.
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_bloc_freezed/domains/shared/data/models/todo/todo.model.dart';
import 'package:todos_bloc_freezed/domains/with_freezed_delete/components/todo_card/todo_card.component.dart';
import 'package:todos_bloc_freezed/domains/with_freezed_delete/logic/todo/todo_bloc.dart';

class ListTodosPage extends StatelessWidget {
  const ListTodosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => TodoBloc()..add(const TodoEvent.list()))
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('List Todos'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<TodoBloc, TodoState>(
            // if we add a new state, this will cause a compiler error
            builder: (context, state) => state.map(
              // if the state is processing, render CircularProgressIndicator
              processing: (state) => const Center(
                child: CircularProgressIndicator(),
              ),
              // if we got a collection of todos, render cards
              list: (state) {
                final todos = state.todos.toList();

                return todos.isEmpty
                    ? const Center(
                        child: Text('No todos found.'),
                      )
                    : ListView.separated(
                        itemBuilder: (context, index) =>
                            // this component actually does not come from
                            // the shared domain, it comes from
                            // with_freezed_delete domain
                            TodoCardComponent(todo: todos[index]),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 8),
                        itemCount: todos.length,
                      );
              },
            ),
          ),
        ),
        floatingActionButton: Builder(
            builder: (context) => FloatingActionButton(
                  onPressed: () async {
                    // get the content
                    final content = await Navigator.of(context)
                        .pushNamed('/without_freezed/create');

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
                      bloc.add(TodoEvent.create(todo: todo));
                    }
                  },
                  child: const Icon(Icons.add),
                )),
      ),
    );
  }
}
