/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Strings support escape sequences for special characters. The
 * escapes are:
 * . . .
 * • \r for carriage return, equivalent to \x0D.
 * @description Checks that \r is equivalent to \x0D.
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

main() {
  var escapeR = '\r';
  var escapeX = '\x0D';

  Expect.identical(escapeR, escapeX);
}
