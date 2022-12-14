// Copyright 2022 Eray Erdin.
// Use of this source code is governed by the WTFPL
// license that can be found in the LICENSE file.

// Copyright 2022 Eray Erdin.
// Use of this source code is governed by the WTFPL
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

class SelectionPage extends StatelessWidget {
  const SelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Type'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () async {
                await Navigator.of(context).pushNamed('/regular/list');
              },
              child: const Text('Without Freezed'),
            ),
            ElevatedButton(
              onPressed: () async {
                await Navigator.of(context).pushNamed('/freezed/list');
              },
              child: const Text('With Freezed'),
            ),
            ElevatedButton(
              onPressed: () async {
                await Navigator.of(context).pushNamed('/freezed_delete/list');
              },
              child: const Text('With Freezed + Delete'),
            ),
          ],
        ),
      ),
    );
  }
}
