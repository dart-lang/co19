/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String message
 * Error message supplied by the operating system. null if no message is
 * associated with the error.
 *
 * @description Checks that message gets error message supplied by the operating
 * system. If there is no error message associated with the error returns "".
 * @author ngl@unipro.ru
 * @issue 30698
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  OSError error = new OSError();
  String message = error.message;
  Expect.equals("", message);

  error = new OSError("bug");
  message = error.message;
  Expect.equals("bug", message);
}
