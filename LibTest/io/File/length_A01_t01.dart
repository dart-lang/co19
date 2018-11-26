/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<int> length()
 * Get the length of the file. Returns a Future<int> that completes with the
 * length in bytes.
 * @description Checks that this method returns the length of the file in bytes.
 * Test empty file
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
  asyncStart();
  await file.length().then((int length) {
    Expect.equals(0, length);
    asyncEnd();
  });
}
