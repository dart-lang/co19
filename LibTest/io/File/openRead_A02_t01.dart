/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<List<int>> openRead([int start, int end])
 * Create a new independent Stream for the contents of this file.
 *
 * If start is present, the file will be read from byte-offset start. Otherwise
 * from the beginning (index 0).
 *
 * If end is present, only up to byte-index end will be read. Otherwise, until
 * end of file.
 *
 * In order to make sure that system resources are freed, the stream must be
 * read to completion or the subscription on the stream must be cancelled.
 * @description Checks that before completion file is locked
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  File file = getTempFileSync();
  file.writeAsBytesSync([1, 2, 3]);
  asyncStart();
  file.openRead().listen((data) {
    Expect.throws(() {file.deleteSync();});
  }).onDone(() {
    asyncEnd();
    file.deleteSync();
  });
}
