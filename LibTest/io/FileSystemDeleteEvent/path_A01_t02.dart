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
 * Test file
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  inSandbox(_main, delay: 2);
}

_main(Directory sandbox) async {
  File f = getTempFileSync(parent: sandbox);
  String path = f.path;
  asyncStart();
  bool first = true;
  sandbox.watch().listen((FileSystemEvent event) {
    if (event is FileSystemDeleteEvent) {
      if (first) {
        first = false;
        Expect.equals(path, event.path);
        asyncEnd();
      }
    }
  });
  f.deleteSync();
}
