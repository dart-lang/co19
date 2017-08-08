/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int mode
 * final
 *
 * The mode of the file system object. Permissions are encoded in the lower 16
 * bits of this number, and can be decoded using the modeString getter.
 * @description Checks that this property returns the mode of the file system
 * object
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/file_utils.dart";

main() {
  File file = getTempFileSync();
  try {
    FileStat fs = FileStat.statSync(file.path);
    if (Platform.isWindows) {
      Expect.equals(33206, fs.mode);
    } else {
      Expect.equals(33206, fs.mode);
    }
  } finally {
    file.delete();
  }
}
