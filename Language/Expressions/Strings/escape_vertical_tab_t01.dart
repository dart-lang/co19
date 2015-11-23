/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Strings support escape sequences for special characters. The
 * escapes are:
 * . . .
 * • \v for vertical tab, equivalent to \x0B.
 * @description Checks that \v is equivalent to \x0B.
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

main() {
  var escapeV = '\v';
  var escapeX = '\x0B';

  Expect.identical(escapeV, escapeX);
}
