/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Directory renameSync(String newPath)
 * Synchronously renames this directory. Returns a Directory instance for the
 * renamed directory.
 *
 * If newPath identifies an existing directory, that directory is replaced. If
 * newPath identifies an existing file the operation fails and an exception is
 * thrown.
 * @description Checks that if newPath identifies an existing file, the
 * operation fails and an exception is thrown.
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/file_utils.dart";

main() {
  Directory srcDir = getTempDirectorySync();
  File file = getTempFileSync();

  Expect.throws(() {srcDir.renameSync(file.path);});

  try {
    Expect.isTrue(srcDir.existsSync());
    Expect.isTrue(file.existsSync());
  } finally {
    srcDir.delete();
    file.delete();
  }
}
