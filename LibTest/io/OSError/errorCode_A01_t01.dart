/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int errorCode
 * Error code supplied by the operating system. Will have the value noErrorCode
 * if there is no error code associated with the error.
 *
 * @description Checks that errorCode gets error code associated with the error.
 * If there is no error code associated with the error returns the value
 * noErrorCode.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  OSError error = new OSError();
  int code = error.errorCode;
  Expect.equals(OSError.noErrorCode, code);

  error = new OSError("", 100);
  code = error.errorCode;
  Expect.equals(100, code);
}
