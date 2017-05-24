/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void createSync({bool recursive: false})
 * Synchronously creates the directory with this name.
 *
 * If recursive is false, only the last directory in the path is created. If
 * recursive is true, all non-existing path components are created. If the
 * directory already exists nothing is done.
 *
 * If the directory cannot be created an exception is thrown.
 * @description Checks that if recursive is true, all non-existing path
 * components are created
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";
import "directory_utils.dart";

test(Directory dir1, Directory dir2) async {
  dir1.exists().then((res1) {
    Expect.isTrue(res1);
    dir2.exists().then((res2) {
      Expect.isTrue(res2);
      dir1.delete(recursive: true);
      asyncEnd();
    });
  });
}

main() {
  Directory dir1 = new Directory("TestDir" + Platform.pathSeparator +
      getTempDirectoryName());
  Directory dir2 = new Directory(dir1.path + Platform.pathSeparator +
      getTempDirectoryName());
  dir2.createSync(recursive: true);

  asyncStart();
  test(dir1, dir2);
}
