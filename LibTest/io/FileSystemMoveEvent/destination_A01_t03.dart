// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion String destination
/// final
/// If the underlying implementation is able to identify the destination of the
/// moved file, destination will be set. Otherwise, it will be null.
/// @description Checks that this property returns the destination of the
/// moved link
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

void _main(Directory sandbox) async {
  Directory dir = getTempDirectorySync(parent: sandbox);
  Link link = getTempLinkSync(parent: dir);
  Link? renamed = null;

  asyncStart();
  await testFileSystemEvent<FileSystemMoveEvent>(dir,
      createEvent: () async {
        renamed = link.renameSync(getTempFilePath(parent: dir));
      }, test: (FileSystemEvent? event) {
        if (event != null && (event as FileSystemMoveEvent).destination != null) {
          Expect.equals(renamed?.path, (event as FileSystemMoveEvent).destination);
        }
      }, failIfNoEvent: false);
  asyncEnd();
}
