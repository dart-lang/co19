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
 * @issue 30429
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  Directory dir = getTempDirectorySync(parent: sandbox);
  File f = getTempFileSync(parent: dir);

  asyncStart();
  await testFileSystemEvent<FileSystemModifyEvent>(dir,
      createEvent: () {
        f.writeAsStringSync("Lily was here");
      }, test: (FileSystemEvent event) {
        Expect.equals(f.path, event.path);
      });
  asyncEnd();
}
