// ignore_for_file: public_member_api_docs, sort_constructors_first
// Copyright 2022 Eray Erdin.
// Use of this source code is governed by the WTFPL
// license that can be found in the LICENSE file.

class Todo {
  final String id;
  final String content;

  Todo({
    required this.id,
    required this.content,
  });

  @override
  bool operator ==(covariant Todo other) {
    if (identical(this, other)) return true;

    return other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'Todo(id: $id, content: $content)';
}
