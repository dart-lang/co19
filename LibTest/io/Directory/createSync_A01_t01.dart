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
 * @description Checks that this method synchronously creates the directory with
 * this name
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";
import "directory_utils.dart";

test(dir) async {
  dir.exists().then((result) {
    Expect.isTrue(result);
    dir.delete();
    asyncEnd();
  });
}

main() {
  Directory dir = new Directory("TestDir" + Platform.pathSeparator +
      getTempDirectoryName());
  dir.createSync();

  asyncStart();
  test(dir);
}
