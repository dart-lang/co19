// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Stream<FileSystemEvent> watch({
///  int events: FileSystemEvent.ALL,
///  bool recursive: false
///  })
/// Start watching the FileSystemEntity for changes.
/// @description Checks that this method watches the FileSystemEntity for
/// changes.
/// @author sgrekhov@unipro.ru

import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

void _main(Directory sandbox) async {
  Directory dir = getTempDirectorySync(parent: sandbox);

  final eventCompleter = new Completer<FileSystemEvent?>();
  StreamSubscription? subscription;
  asyncStart();
  subscription = dir.watch().listen((FileSystemEvent event) async {
    eventCompleter.complete(event);
    await subscription?.cancel();
    Expect.equals(FileSystemEvent.create, event.type);
    asyncEnd();
  });
  dir.createTempSync();
  await eventCompleter.future
      .timeout(Duration(seconds: eventsTimeout), onTimeout: () async {
    await subscription?.cancel();
  });
}
