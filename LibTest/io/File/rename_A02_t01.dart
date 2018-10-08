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
 * @description Checks that if newPath identifies an existing file, that file is
 * replaced
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  File file = getTempFileSync();
  File ren = null;
  File target = getTempFileSync();
  file.writeAsStringSync("Source");
  target.writeAsStringSync("Target");

  asyncStart();
  file.rename(target.path).then((renamed) {
    ren = renamed;
    Expect.equals(target.path, renamed.path);
    Expect.isTrue(renamed.existsSync());
    Expect.equals("Source", renamed.readAsStringSync());
    Expect.isFalse(file.existsSync());
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
