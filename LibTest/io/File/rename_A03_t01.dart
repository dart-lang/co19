/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<File> rename(String newPath)
 * Renames this file. Returns a Future<File> that completes with a File instance
 * for the renamed file.
 *
 * If newPath identifies an existing file, that file is replaced. If newPath
 * identifies an existing directory, the operation fails and the future
 * completes with an exception.
 * @description Checks that If newPath identifies an existing directory, the
 * operation fails and the future completes with an exception.
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  File file = getTempFileSync();
  Directory target = getTempDirectorySync();

  asyncStart();
  file.rename(target.path).then((renamed) {
    renamed.delete();
    Expect.fail("FileSystemException expected");
  }, onError: (e) {
    Expect.isTrue(e is FileSystemException);
    asyncEnd();
  }).whenComplete(() {
    if (file.existsSync()) {
      file.delete();
    }
    target.delete();
  });
}
