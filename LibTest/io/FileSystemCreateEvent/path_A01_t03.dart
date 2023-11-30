// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion String path
/// final
/// The path that triggered the event. Depending on the platform and the
/// FileSystemEntity, the path may be relative.
/// @description Checks that this property returns path that triggered the event.
/// Test Link
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

void _main(Directory sandbox) async {
  Directory dir = getTempDirectorySync(parent: sandbox);
  Directory target = getTempDirectorySync(parent: sandbox);
  asyncStart();

  String? path = null;
  await testFileSystemEvent<FileSystemCreateEvent>(dir,
      createEvent: () async {
        path = getTempLinkSync(parent: dir, target: target.path).path;
      }, test: (FileSystemEvent? event) {
        Expect.equals(path, event?.path);
      });
  asyncEnd();
}
