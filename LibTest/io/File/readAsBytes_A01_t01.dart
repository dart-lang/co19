/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<List<int>> readAsBytes()
 * Read the entire file contents as a list of bytes. Returns a Future<List<int>>
 * that completes with the list of bytes that is the contents of the file.
 * @description Checks that this method reads the entire file contents as a list
 * of bytes. Test empty file
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  File file = getTempFileSync();
  asyncStart();
  file.readAsBytes().then((data) {
    Expect.listEquals([], data);
    asyncEnd();
  }).whenComplete(() {
    file.delete();
  });
}
