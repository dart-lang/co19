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
 * Test link
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  Directory sandbox = getTempDirectorySync();
  String path = null;
  Link l = null;
  int createCount = 0;
  asyncStart();
  StreamSubscription s = null;
  s = sandbox.watch().listen((FileSystemEvent event) {
    if (event is FileSystemDeleteEvent) {
      try {
        Expect.equals(path, event.path);
        asyncEnd();
      } finally {
        s.cancel().then((_) {
          sandbox.delete(recursive: true);
        });
      }
    } else {
      createCount++;
      if (createCount > 1) {
        l.delete();
      }
    }
  });
  l = getTempLinkSync(parent: sandbox);
  path = l.path;
}
