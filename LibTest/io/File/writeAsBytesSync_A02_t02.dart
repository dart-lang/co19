/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void writeAsBytesSync(
 * List<int> bytes, {
 * FileMode mode: FileMode.write,
 * bool flush: false
 * })
 * Synchronously write a list of bytes to a file.
 *
 * Opens the file, writes the list of bytes to it and closes the file.
 *
 * By default writeAsBytesSync creates the file for writing and truncates the
 * file if it already exists. In order to append the bytes to an existing file,
 * pass FileMode.append as the optional mode parameter.
 *
 * If the flush argument is set to true data written will be flushed to the file
 * system before returning.
 *
 * Throws a FileSystemException if the operation fails.
 * @description Checks that by default writeAsBytesSync creates the file for
 * writing and truncates the file if it already exists
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
  file.writeAsBytesSync([1, 1, 1, 1, 1]);
  file.writeAsBytesSync([3, 1, 4, 1, 5]);
  Expect.isTrue(file.existsSync());
  Expect.listEquals([3, 1, 4, 1, 5], file.readAsBytesSync());
}
