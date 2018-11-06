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
import "../../../Utils/expect.dart";
import "../file_utils.dart";

String path = null;

test(String toTest) {
  if (path == null) {
    path = toTest;
  } else {
    Expect.equals(path, toTest);
  }
}

main() {
  inSandbox(_main, delay: 2);
}

_main(Directory sandbox) async {
  Directory dir = getTempDirectorySync(parent: sandbox);
  Directory target = getTempDirectorySync(parent: sandbox);

  asyncStart();
  dir.watch().listen((FileSystemEvent event) {
    if (event is FileSystemCreateEvent) {
      test(event.path);
      asyncEnd();
    }
  });
  getTempLink(parent: dir, target: target.path).then((Link link) {
    test(link.path);
  });
}
