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

main() {
  bool called = false;
  Directory dir = getTempDirectorySync();
  asyncStart();
  StreamSubscription s =
      dir.watch(events: FileSystemEvent.create).listen((FileSystemEvent event) {
    Expect.isFalse(called);
    called = true;
  });
  Directory child = dir.createTempSync();
  child.createTempSync();

  new Future.delayed(new Duration(seconds: 1)).then((_) {
    s.cancel().then((_) {
      dir.delete(recursive: true);
      asyncEnd();
    });
  });
}
