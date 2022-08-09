// ignore_for_file: public_member_api_docs, sort_constructors_first
// Copyright 2022 Eray Erdin.
// Use of this source code is governed by the WTFPL
// license that can be found in the LICENSE file.
import 'package:flutter/material.dart';
import 'package:todos_bloc_freezed/domains/shared/data/models/todo/todo.model.dart';

class TodoCardComponent extends StatelessWidget {
  final Todo todo;

  const TodoCardComponent({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Text(todo.content),
          ],
        ),
      ),
    );
  }
}
