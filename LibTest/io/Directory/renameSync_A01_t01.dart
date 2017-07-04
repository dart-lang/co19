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
 * @description Checks that this method synchronously renames this directory and
 * returns a Directory instance for the renamed directory.
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";
import "../../../Utils/file_utils.dart";

test(Directory dir, Directory renamed) async {
  renamed.exists().then((res) {
      Expect.isTrue(res);
    dir.exists().then((res) {
      try {
        Expect.isFalse(res);
        asyncEnd();
      } finally {
        renamed.delete();
      }
    });
  });
}

main() {
  Directory dir = getTempDirectorySync();
  Directory renamed = dir.renameSync(dir.parent.path + Platform.pathSeparator +
      getTempDirectoryName());

  asyncStart();
  test(dir, renamed);
}
