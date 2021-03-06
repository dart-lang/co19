// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Directory renameSync(String newPath)
/// Synchronously renames this directory. Returns a Directory instance for the
/// renamed directory.
///
/// If newPath identifies an existing directory, that directory is replaced. If
/// newPath identifies an existing file the operation fails and an exception is
/// thrown.
/// @description Checks that if newPath identifies an existing directory and
/// this directory is not empty,then an error occurs
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  Directory srcDir = getTempDirectorySync(parent: sandbox);
  Directory targetDir = getTempDirectorySync(parent: sandbox);
  targetDir.createTempSync();

  try {
    srcDir.renameSync(targetDir.path);
    Expect.fail("Directory should not be renamed");
  } catch (_) {}
}
