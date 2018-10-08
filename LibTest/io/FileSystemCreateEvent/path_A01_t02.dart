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
 * Test File
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  Directory dir = getTempDirectorySync();
  String path = null;
  asyncStart();
  StreamSubscription s = dir.watch().listen((FileSystemEvent event) {
    if (path != null) {
      Expect.equals(path, event.path);
      asyncEnd();
    } else {
      path = event.path;
    }
  });

  getTempFile(parent: dir).then((File file) {
    if (path != null) {
      Expect.equals(file.path, path);
      asyncEnd();
    } else {
      path = file.path;
    }
  }).timeout(new Duration(seconds: 1)).then((_) {
    s.cancel().then((_) {
      dir.delete(recursive: true);
    });
  });
}
