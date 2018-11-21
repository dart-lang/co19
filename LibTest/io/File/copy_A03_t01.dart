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
 * @description Checks that if newPath identifies an existing directory, the
 * operation fails and the future completes with an exception
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  File file = getTempFileSync(parent: sandbox);
  Directory dir = getTempDirectorySync(parent: sandbox);
  asyncStart();
  await file.copy(dir.path).then((File copied) {
    file.delete();
    dir.delete();
    Expect.fail("Exception expected");
  }, onError: (_) {
    Expect.isTrue(dir.existsSync());
    asyncEnd();
  });
}
