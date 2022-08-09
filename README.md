# Bloc + Freezed Example for Flutter

![tested flutter version is 3.0.5](https://img.shields.io/badge/flutter-3.0.5-blue?style=flat-square)
![tested bloc version is 8.1.0](https://img.shields.io/badge/bloc-8.1.0-blue?style=flat-square)
![tested freezed version is 2.1.0](https://img.shields.io/badge/freezed-2.1.0-blue?style=flat-square)
![tested build_runner version is 2.1.0](https://img.shields.io/badge/build_runner-2.2.0-blue?style=flat-square)

This repo contains some examples for using [Bloc](https://bloclibrary.dev/#/) with [Freezed](https://pub.dev/packages/freezed).

## How to Read This Repository

### Directory Structure

`/lib/domains` are where the domains live.

There are four domains:

 - `/lib/domains/shared` for shared/common stuff
 - `/lib/domains/regular` for the example not using `freezed`, but regular bloc with [equatable](https://pub.dev/packages/equatable)
 - `/lib/domains/freezed` for the example using `freezed`
 - `/lib/domains/freezed_delete` is almost the same as `freezed`, plus **a delete event** to delete todos and a todo card specific for this purpose

Each domain may or may not contain one of these layers as directories:

 - `data` directory for models, providers and repositories
    - `data/models` for models
    - `data/providers` for providers
    - `data/repositories` for repositories
 - `logic` directory for blocs or cubits, each subdirectory is a different bloc or cubit
 - `presentation` directory for components and pages
    - `presentation/components` for components that are reused and are not used as standalone pages
    - `presentation/pages` for pages that have their own URLs and are used standalone

### Quick Navigation

Instead of checking the whole repository, you might want to check out these locations:

 - [Regular TodoBloc](lib/domains/regular/logic/todo/todo_bloc.dart) vs [Freezed TodoBloc](lib/domains/freezed/logic/todo/todo_bloc.dart) to check out the differences, especially how the events are handled
 - [Regular TodoEvent](lib/domains/regular/logic/todo/todo_event.dart) vs [Freezed TodoEvent](lib/domains/freezed/logic/todo/todo_event.dart) to check out the differences
 - [Regular TodoState](lib/domains/regular/logic/todo/todo_state.dart) vs [Freezed TodoEvent](lib/domains/freezed/logic/todo/todo_state.dart) to check out the differences
 - [How the state is handled regularly](lib/domains/regular/presentation/pages/list_todos/list_todos.page.dart#L25) vs [How it's handled with freezed](lib/domains/freezed/presentation/pages/list_todos/list_todos.page.dart#L26) while listing the todos in `ListTodosPage`s

## VSCode Integration

This repository is tightly integrated with VSCode and uses its features extensively.

You can check this repository out without even installing VSCode [here](https://github.dev/erayerdin2/todos-bloc-freezed).

It [recommends some extensions](.vscode/extensions.json) for some features such as integrating better with Flutter and Dart environment, hiding redundant files and directories, better integration with Bloc, adding automatic license header, creating data classes easily.

It has [settings](.vscode/settings.json) to hide redundant files and directories so that you can focus on what matters, to add automatic license header, fixing your code on save.

It has [tasks](.vscode/tasks.json) so that you can generate freezed files easily. It automatically runs at the startup of VSCode.

It has a special [launch configuration](.vscode/launch.json) that shows more verbose logging while compiling the project, so you can see what is going on if you ever have a problem while compiling it.

## License

This project is licensed under the terms of [Do What The Fuck You Want To Public License 2.0](http://www.wtfpl.net/) (WTFPL 2.0, in short). What you can, cannot and must do with is can be seen [here](https://tldrlegal.com/license/do-wtf-you-want-to-public-license-v2-(wtfpl-2.0)). You can also see it in [LICENSE](LICENSE) file and the headers of each of the files.