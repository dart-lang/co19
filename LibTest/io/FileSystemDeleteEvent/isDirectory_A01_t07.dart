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
 * directory. Test watched directory deleted async
 * @issue 35032
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  if (!Platform.isWindows) {
    await inSandbox(_main);
  }
}

_main(Directory sandbox) async {
  Directory dir = getTempDirectorySync(parent: sandbox);

  asyncStart();
  await testFileSystemEvent<FileSystemDeleteEvent>(dir,
      createEvent: () {
        dir.deleteSync();
      }, test: (FileSystemEvent event) {
        Expect.isFalse(event.isDirectory);
      });
  asyncEnd();
}
