// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion String destination
/// final
/// If the underlying implementation is able to identify the destination of the
/// moved file, destination will be set. Otherwise, it will be null.
/// @description Checks that this property returns the destination of the
/// moved directory
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

void _main(Directory sandbox) async {
  Directory dir = getTempDirectorySync(parent: sandbox);
  Directory? renamed = null;
  asyncStart();

  await testFileSystemEvent<FileSystemMoveEvent>(sandbox,
      createEvent: () async {
        renamed = dir.renameSync(getTempDirectoryPath(parent: sandbox));
      }, test: (FileSystemEvent? event) {
        if (event != null && (event as FileSystemMoveEvent).destination != null) {
          Expect.equals(renamed?.path, (event as FileSystemMoveEvent).destination);
        }
      }, failIfNoEvent: false);
  asyncEnd();
}
