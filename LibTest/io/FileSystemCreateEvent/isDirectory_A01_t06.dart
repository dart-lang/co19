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
 * directory. Test create link synchronously
 * @issue 30359
 * @issue 35102
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  inSandbox(_main);
}

_main(Directory sandbox) async {
  Directory dir = getTempDirectorySync(parent: sandbox);
  Directory target = getTempDirectorySync(parent: sandbox);
  asyncStart();

  await testFileSystemEvent<FileSystemCreateEvent>(dir,
      createEvent: () {
        getTempLinkSync(parent: dir, target: target.path);
      }, test: (FileSystemEvent event) {
        Expect.isFalse(event.isDirectory);
      });
  asyncEnd();
}
