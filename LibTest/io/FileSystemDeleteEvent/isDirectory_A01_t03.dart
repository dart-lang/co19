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
 * directory. Test directory deleted synchronously
 * @issue 30359
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  asyncStart();

  await testFileSystemEvent<FileSystemDeleteEvent>(sandbox,
      createEvent: () async {
        Directory d = sandbox.createTempSync();
        await d.delete();
      }, test: (FileSystemEvent event) {
        if (Platform.isWindows) {
          Expect.isFalse(event.isDirectory);
        } else {
          Expect.isTrue(event.isDirectory);
        }
      });
  asyncEnd();
}
