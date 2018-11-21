/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void writeAsStringSync(
 *  String contents, {
 *  FileMode mode: FileMode.write,
 *  Encoding encoding: utf8,
 *  bool flush: false
 *  })
 * Synchronously write a string to a file.
 *
 * Opens the file, writes the string in the given encoding, and closes the file.
 *
 * By default writeAsStringSync creates the file for writing and truncates the
 * file if it already exists. In order to append the bytes to an existing file,
 * pass FileMode.append as the optional mode parameter.
 *
 * If the flush argument is set to true data written will be flushed to the file
 * system before returning.
 *
 * Throws a FileSystemException if the operation fails.
 * @description Checks that this method writes a string to a file in the
 * encoding specified by encoding argument
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:convert";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  Encoding encoding = Encoding.getByName("iso-8859-1");
  File file = getTempFileSync(parent: sandbox);
  String toWrite = "â\nã";
  file.writeAsStringSync(toWrite, encoding: encoding);
  Expect.equals(toWrite, file.readAsStringSync(encoding: encoding));
  Expect.listEquals([0xe2, 0xa, 0xe3], file.readAsBytesSync());
}
