/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion IOSink openWrite({
 * FileMode mode: FileMode.WRITE,
 * Encoding encoding: UTF8
 * })
 * Creates a new independent IOSink for the file. The IOSink must be closed when
 * no longer used, to free system resources.
 *
 * An IOSink for a file can be opened in two modes:
 *
 * FileMode.WRITE: truncates the file to length zero.
 * FileMode.APPEND: sets the initial write position to the end of the file.
 * When writing strings through the returned IOSink the encoding specified using
 * encoding will be used. The returned IOSink has an encoding property which can
 * be changed after the IOSink has been created.
 * @description Checks that this method creates a new independent IOSink for the
 * file. Test READ mode
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/file_utils.dart";

main() {
  File file = getTempFileSync();
  file.writeAsStringSync("UTF-8: кириллица прекрасна");
  Expect.throws(() {file.openWrite(mode: FileMode.READ);});
}
