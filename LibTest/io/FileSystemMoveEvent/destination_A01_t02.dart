/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String destination
 * final
 * If the underlying implementation is able to identify the destination of the
 * moved file, destination will be set. Otherwise, it will be null.
 * @description Checks that this property returns the destination of the
 * moved directory
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  Directory dir = getTempDirectorySync();
  Directory renamed = null;
  asyncStart();
  StreamSubscription s = null;
  s = dir.watch().listen((FileSystemEvent event) {
    if (event is FileSystemMoveEvent) {
      if (event.destination != null) {
        try {
          Expect.equals(renamed.path, event.destination);
          asyncEnd();
        } finally {
          dir.delete(recursive: true);
          s.cancel();
        }
      }
    }
  });
  Directory d = getTempDirectorySync(parent: dir);
  renamed = d.renameSync(getTempDirectoryPath(parent: dir));
}
