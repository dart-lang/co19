/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String path
 * final
 * The path that triggered the event. Depending on the platform and the
 * FileSystemEntity, the path may be relative.
 * @description Checks that this property returns path that triggered the event.
 * Test Link
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

String path = null;

test(String toTest, StreamSubscription s, Directory dir) {
  if (path == null) {
    path = toTest;
  } else {
    s.cancel().then((_) {
      dir.delete(recursive: true);
    }).then((_) {
      Expect.equals(path, toTest);
      asyncEnd();
    });
  }
}

main() {
  Directory sandbox = getTempDirectorySync();
  Directory dir = getTempDirectorySync(parent: sandbox);
  Directory target = getTempDirectorySync(parent: sandbox);

  asyncStart();
  StreamSubscription s = null;
  s = dir.watch().listen((FileSystemEvent event) {
    test(event.path, s, sandbox);
  });
  getTempLink(parent: dir, target: target.path).then((Link link) {
    test(link.path, s, sandbox);
  });
}
