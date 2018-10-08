/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion IOSink openWrite({
 * FileMode mode: FileMode.write,
 * Encoding encoding: utf8
 * })
 * Creates a new independent IOSink for the file. The IOSink must be closed when
 * no longer used, to free system resources.
 *
 * An IOSink for a file can be opened in two modes:
 *
 * FileMode.write: truncates the file to length zero.
 * FileMode.append: sets the initial write position to the end of the file.
 * When writing strings through the returned IOSink the encoding specified using
 * encoding will be used. The returned IOSink has an encoding property which can
 * be changed after the IOSink has been created.
 * @description Checks that this method creates a new independent IOSink for the
 * file. Test encoding argument
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
  sink.writeCharCode(0xe3);
  asyncStart();
  sink.close().then((_) {
    try {
      Expect.equals("âã", file.readAsStringSync(encoding: encoding));
      asyncEnd();
    } finally {
      file.delete();
    }
  });
}
