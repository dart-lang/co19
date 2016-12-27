/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Strings can contain surrogates:
 *    - if all characters of the String are 8 bits code points, the
 *      String is a list of bytes.
 * @description Checks that String can be stored in UTF-16
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  String str = "a"; //UTF-8;
  str = "$str\u1d02"; //UTF-16;
  str = "$str\u{10000}"; //UTF-16 with surrogate pair
  
  Expect.equals(str, "\u0061\u1d02\u{10000}");
  Expect.equals(4, str.length);
}
