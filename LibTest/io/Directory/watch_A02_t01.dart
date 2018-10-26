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
  Directory dir = getTempDirectorySync();
  Directory child1 = getTempDirectorySync(parent: dir);
  asyncStart();
  StreamSubscription s = null;
  s = dir.watch().listen((FileSystemEvent event) {
    s.cancel().then((_) {
      dir.delete(recursive: true);
    }).then((_) {
      Expect.equals(FileSystemEvent.modify, event.type);
      asyncEnd();
    });
  });
  child1.createTemp();
}
