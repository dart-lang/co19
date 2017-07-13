/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int lengthSync()
 * Synchronously get the length of the file.
 *
 * Throws a FileSystemException if the operation fails.
 * @description Checks that this method returns the length of the file in bytes.
 * Test not empty file
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/file_utils.dart";

main() {
  List<int> bytes = [1, 2, 3, 17, 255];

  File file = getTempFileSync();
  file.writeAsBytesSync(bytes);
  try {
    Expect.equals(bytes.length, file.lengthSync());
  } finally {
    file.delete();
  }
}
