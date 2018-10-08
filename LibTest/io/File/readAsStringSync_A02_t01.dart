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
 * @description Checks that this method synchronously reads the entire file
 * contents as string using the given Encoding. Test encoding argument
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:convert";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  Encoding encoding = Encoding.getByName("iso-8859-1");
  File file = getTempFileSync();

  IOSink sink = file.openWrite(encoding: encoding);
  sink.writeCharCode(0xe2);
  sink.writeCharCode(0xa);
  sink.writeCharCode(0xe3);
  asyncStart();
  sink.close().then((_) {
    try {
      Expect.equals("â\nã", file.readAsStringSync(encoding: encoding));
      asyncEnd();
    } finally {
      file.delete();
    }
  });
}
