// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool isDirectory
/// final
/// Is true if the event target was a directory.
/// @description Checks that this property returns true if the event target was a
/// directory. Test Link
/// @author sgrekhov@unipro.ru
/// @issue 30644

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

void _main(Directory sandbox) async {
  Directory dir = getTempDirectorySync(parent: sandbox);
  Link link = getTempLinkSync(parent: dir);

  asyncStart();
  await testFileSystemEvent<FileSystemMoveEvent>(dir,
      createEvent: () async {
        link.renameSync(getTempFilePath(parent: dir));
      }, test: (FileSystemEvent? event) {
        if (event != null) {
          Expect.isFalse(event.isDirectory);
        }
      }, failIfNoEvent: false);
  asyncEnd();
}
