/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Strings support escape sequences for special characters. The
 * escapes are:
 * • \n for newline, equivalent to \x0A.
 * @description Checks that \n is equivalent to \x0A and newline.
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

main() {
  var escapeN = '\n';
  var escapeX = '\x0A';
  var newline = """

""";

  Expect.identical(escapeN, escapeX);
  Expect.identical(escapeN, newline);
}
