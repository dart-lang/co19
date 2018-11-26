/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<List<String>> readAsLines({Encoding encoding: utf8})
 * Read the entire file contents as lines of text using the given Encoding.
 *
 * Returns a Future<List<String>> that completes with the lines once the file
 * contents has been read.
 * @description Checks that this method reads the entire file contents as lines
 * of text using the given Encoding. Test not empty file with several lines
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
  file.writeAsStringSync("Line 1\nLine 2\rLine3");
  asyncStart();
  await file.readAsLines().then((data) {
    Expect.listEquals(["Line 1", "Line 2", "Line3"], data);
    asyncEnd();
  });
}
