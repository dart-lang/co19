/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<Directory> rename(String newPath)
 * Renames this directory. Returns a Future<Directory> that completes with a
 * Directory instance for the renamed directory.
 *
 * If newPath identifies an existing directory, that directory is replaced. If
 * newPath identifies an existing file, the operation fails and the future
 * completes with an exception.
 * @description Checks that if newPath identifies an existing file, the
 * operation fails and the future
 * completes with an exception.
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

test(Directory srcDir, Directory target) async {
  bool thrown = false;
  srcDir.rename(target.path).catchError((e) {
    thrown = true;
  }).then((d) {
    try {
      Expect.isTrue(thrown);
    } finally {
      srcDir.delete();
      asyncEnd();
    }
  });
}

main() {
  Directory parent = new Directory("TestDir");
  Directory srcDir = parent.createTempSync();
  Directory target = new Directory("TestDir" + Platform.pathSeparator + "tmp.dart");

  asyncStart();
  test(srcDir, target);
}
