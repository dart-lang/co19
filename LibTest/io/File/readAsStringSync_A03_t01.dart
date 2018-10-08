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
 * @description Checks that a FileSystemException is thrown if the operation
 * fails
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  File file = getTempFileSync();
  file.deleteSync();
  Expect.throws(() {file.readAsStringSync();}, (e) => e is FileSystemException);
}
