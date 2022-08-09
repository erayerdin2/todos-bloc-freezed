// Copyright 2022 Eray Erdin.
// Use of this source code is governed by the WTFPL
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:todos_bloc_freezed/di.dart';
import 'package:todos_bloc_freezed/domains/shared/presentation/pages/selection/selection.page.dart';
import 'package:todos_bloc_freezed/domains/without_freezed/presentation/pages/create_todo/create_todo.page.dart'
    as create_todo_without_freezed_page;
import 'package:todos_bloc_freezed/domains/without_freezed/presentation/pages/list_todos/list_todos.page.dart'
    as list_todos_without_freezed_page;

void main() {
  setUpDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc with Freezed Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const SelectionPage(),
        '/without_freezed/list': (context) =>
            const list_todos_without_freezed_page.ListTodosPage(),
        '/without_freezed/create': (context) =>
            const create_todo_without_freezed_page.CreateTodoPage(),
      },
      initialRoute: '/',
    );
  }
}
