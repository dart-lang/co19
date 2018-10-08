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
 * @description Checks that this method returns a Future<File> that completes
 * with a File instance for the renamed file.
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  File file = getTempFileSync();
  File ren = null;
  file.writeAsStringSync("File content");
  String newName = getTempFilePath();

  asyncStart();
  file.rename(newName).then((renamed) {
    ren = renamed;
    Expect.equals(newName, renamed.path);
    Expect.isTrue(renamed.existsSync());
    Expect.isFalse(file.existsSync());
    Expect.equals("File content", renamed.readAsStringSync());
    asyncEnd();
  }).whenComplete(() {
    if (ren != null) {
      ren.delete();
    }
    if (file.existsSync()) {
      file.delete();
    }
  });
}
