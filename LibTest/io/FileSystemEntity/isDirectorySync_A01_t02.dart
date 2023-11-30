// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool isDirectorySync(String path)
/// Synchronously checks if typeSync(path) returns
/// FileSystemEntityType.directory.
///
/// @description Checks that this property Synchronously checks if typeSync(path)
/// returns FileSystemEntityType.directory. Test Directory
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

void _main(Directory sandbox) {
  Directory dir = getTempDirectorySync(parent: sandbox);
  Expect.isTrue(FileSystemEntity.isDirectorySync(dir.path));
  Expect.equals(FileSystemEntityType.directory,
      FileSystemEntity.typeSync(dir.path));
}
