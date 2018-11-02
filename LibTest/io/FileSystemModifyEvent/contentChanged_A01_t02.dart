/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool contentChanged
 *  final
 * If the content was changed and not only the attributes, contentChanged is
 * true.
 * @description Checks that this property returns true if the content was
 * changed
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  inSandbox(_main, delay: 2);
}

_main(Directory sandbox) async {

  Directory dir = getTempDirectorySync(parent: sandbox);
  File f = getTempFileSync(parent: dir);
  asyncStart();
  dir.watch().listen((FileSystemEvent event) {
    if (event is FileSystemModifyEvent) {
        Expect.isTrue(event.contentChanged);
        asyncEnd();
    }
  });
  f.writeAsStringSync("Lily was here");
}
