/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<FileSystemEvent> watch({
 *  int events: FileSystemEvent.ALL,
 *  bool recursive: false
 *  })
 * Start watching the FileSystemEntity for changes.
 * @description Checks that this method watches the FileSystemEntity for
 * changes. Test recursive parameter
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  Directory dir = getTempDirectorySync(parent: sandbox);
  Directory child = dir.createTempSync();

  final eventCompleter = new Completer<FileSystemEvent>();
  StreamSubscription subscription;
  asyncStart();
  subscription = dir.watch(events: FileSystemEvent.create,
      recursive: true).listen((FileSystemEvent event) async {
    eventCompleter.complete(event);
    await subscription.cancel();
    if (event.type != FileSystemEvent.create) {
      Expect.fail("Wrong event arrived");
    } else {
      asyncEnd();
    }
  });
  child.createTempSync();

  await eventCompleter.future
      .timeout(Duration(seconds: eventsTimeout), onTimeout: () async {
    await subscription.cancel();
    Expect.fail("Watch timed out");
  });
}
