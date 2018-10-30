/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isDirectory
 * final
 * Is true if the event target was a directory.
 * @description Checks that this property returns true if the event target was a
 * directory. Test file deleted synchronously
 * @issue 30359
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  Directory sandbox = getTempDirectorySync();
  File f = null;
  asyncStart();
  StreamSubscription s = null;
  s = sandbox.watch().listen((FileSystemEvent event) {
    if (event is FileSystemDeleteEvent) {
      try {
        Expect.isFalse(event.isDirectory);
        asyncEnd();
      } finally {
        s.cancel().then((_) {
          sandbox.delete(recursive: true);
        });
      }
    } else {
      f.deleteSync();
    }
  });
  f = getTempFileSync(parent: sandbox);
}