/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion File renameSync(String newPath)
 * Synchronously renames this file. Returns a File instance for the renamed
 * file.
 *
 * If newPath identifies an existing file, that file is replaced. If newPath
 * identifies an existing directory the operation fails and an exception is
 * thrown.
 * @description Checks that if newPath identifies an existing directory the
 * operation fails and an exception is thrown.
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/file_utils.dart";

main() {
  File file = getTempFileSync();
  Directory target = getTempDirectorySync();

  try {
    Expect.throws(() {
      file.renameSync(target.path);
    });

    Expect.isTrue(file.existsSync());
    Expect.isTrue(target.existsSync());
  } finally {
    target.delete(recursive: true);
    file.delete(recursive: true);
  }
}
