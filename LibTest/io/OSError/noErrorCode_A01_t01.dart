/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int noErrorCode = -1
 * Constant used to indicate that no OS error code is available.
 *
 * @description Checks that noErrorCode used to indicate that no OS error code
 * is available and its value is -1.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  OSError error = new OSError();
  Expect.equals(OSError.noErrorCode, error.errorCode);
  Expect.equals(-1, OSError.noErrorCode);
}
