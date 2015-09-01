/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion All string literals implement the built-in class String.
 * @description Checks that string literals implement class String.
 * @author msyabro
 * @reviewer kaigorodov
 */
import '../../../Utils/expect.dart';

main() {
  Expect.isTrue("" is String);
  Expect.isTrue('' is String);
  Expect.isTrue(r"" is String);
  Expect.isTrue(r'' is String);
  Expect.isTrue("""""" is String);
  Expect.isTrue('''''' is String);
  Expect.isTrue(r"""""" is String);
  Expect.isTrue(r'''''' is String);

  Expect.isTrue("String" is String);
  Expect.isTrue('\x00\x01\x02' is String);
  Expect.isTrue(r"\\\\\\\\" is String);
  Expect.isTrue(r'$$$$$' is String);
  Expect.isTrue("""
                new line """ is String);
}
