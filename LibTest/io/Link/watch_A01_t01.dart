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
 * changes.
 * @author sgrekhov@unipro.ru
 * @issue 30918
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  Directory target1 = getTempDirectorySync();
  Directory target2 = getTempDirectorySync();
  Link link = getTempLinkSync(target: target1.path);

  asyncStart();
  StreamSubscription s = link.watch().listen((FileSystemEvent event) {
    Expect.equals(FileSystemEvent.modify, event.type);
    asyncEnd();
  });
  link.update(target2.path).then((_) {}).timeout(new Duration(seconds: 1)).then((_) {
    target2.createTempSync();
    s.cancel().then((_) {
      target1.delete(recursive: true);
      target2.delete(recursive: true);
      link.delete();
    });
  });
}
