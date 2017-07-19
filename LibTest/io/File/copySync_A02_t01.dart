/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion File copySync(String newPath)
 * Synchronously copy this file. Returns a File instance for the copied file.
 *
 * If newPath identifies an existing file, that file is replaced. If newPath
 * identifies an existing directory the operation fails and an exception is
 * thrown.
 * @description Checks that if newPath identifies an existing file, that file is
 * replaced
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/file_utils.dart";

main() {
  File file1 = getTempFileSync();
  File file2 = getTempFileSync();
  file2.writeAsStringSync("Existing file content");

  File copied = null;
  try {
    copied = file1.copySync(file2.path);
    Expect.equals(file2.path, copied.path);
    Expect.isTrue(copied.existsSync());
    Expect.equals("", copied.readAsStringSync());
  } finally {
    file1.delete();
    file2.delete();
  }
}
