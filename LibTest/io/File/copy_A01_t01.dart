/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<File> copy(String newPath)
 * Copy this file. Returns a Future<File> that completes with a File instance
 * for the copied file.
 *
 * If newPath identifies an existing file, that file is replaced. If newPath
 * identifies an existing directory, the operation fails and the future
 * completes with an exception.
 * @description Checks that this method copies the file
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  File file = getTempFileSync();
  File copy = null;
  asyncStart();
  String newPath = getTempFilePath();
  file.copy(newPath).then((File copied) {
    copy = copied;
    Expect.equals(newPath, copied.path);
    Expect.isTrue(copied.existsSync());
    asyncEnd();
  }).whenComplete(() {
    file.delete();
    if (copy != null) {
      copy.delete();
    }
  });
}
