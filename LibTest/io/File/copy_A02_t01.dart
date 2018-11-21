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
 * @description Checks that if newPath identifies an existing file, that file is
 * replaced
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  File file1 = getTempFileSync(parent: sandbox);
  File file2 = getTempFileSync(parent: sandbox);
  file2.writeAsStringSync("Existing file content");
  asyncStart();
  await file1.copy(file2.path).then((File copied) {
    Expect.equals(file2.path, copied.path);
    Expect.isTrue(copied.existsSync());
    Expect.equals("", copied.readAsStringSync());
    asyncEnd();
  });
}
