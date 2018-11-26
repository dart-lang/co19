/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String readAsStringSync({Encoding encoding: utf8})
 * Synchronously read the entire file contents as a string using the given
 * Encoding.
 *
 * Throws a FileSystemException if the operation fails.
 * @description Checks that this method synchronously read the entire file
 * contents as a string using the given Encoding. Test not existing file
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  File file = new File(getTempFilePath(parent: sandbox));
  file.writeAsStringSync("Line 1\nLine 2\rLine3");
  Expect.equals("Line 1\nLine 2\rLine3", file.readAsStringSync());
}
