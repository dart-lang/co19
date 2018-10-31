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
 * moved file
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  Directory sandbox = getTempDirectorySync();
  Directory dir = getTempDirectorySync(parent: sandbox);
  File renamed = null;
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
  File file = getTempFileSync(parent: dir);
  renamed = file.renameSync(getTempFilePath(parent: dir));
}
