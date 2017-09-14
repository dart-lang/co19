/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toString()
 * Converts an OSError object to a string representation.
 *
 * @description Checks that method [toString] returns a string representation of
 * OSError object.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  OSError error = new OSError();
  String errString = error.toString();
  Expect.equals("OS Error", errString);

  error = new OSError("bug", 101);
  errString = error.toString();
  Expect.equals("OS Error: bug, errno = 101", errString);
}
