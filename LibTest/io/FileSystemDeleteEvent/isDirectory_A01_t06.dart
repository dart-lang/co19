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
 * directory. Test Link deleted synchronously
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  Directory dir = getTempDirectorySync();
  Link l = null;
  int createCount = 0;
  asyncStart();
  StreamSubscription s = dir.watch().listen((FileSystemEvent event) {
    if (event is FileSystemDeleteEvent) {
      if (Platform.isWindows) {
        Expect.isFalse(event.isDirectory);
      } else {
        Expect.isTrue(event.isDirectory);
      }
      asyncEnd();
    } else {
      createCount++;
      if (createCount > 1) {
        l.deleteSync();
      }
    }
  });
  l = getTempLinkSync(parent: dir);

  new Future.delayed(new Duration(seconds: 1)).then((_) {
    s.cancel().then((_) {
      dir.delete(recursive: true);
    });
  });
}
