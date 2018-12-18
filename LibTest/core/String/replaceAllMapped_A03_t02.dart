/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String replaceAllMapped(Pattern from, String replace(Match match))
 * ...
 * If the value returned by calling replace is not a String, it is converted to
 * a String using its toString method, which must then return a string.
 * @description Checks that if the value returned by calling replace is not a
 * String, it is converted to a String using its toString method, which must
 * then return a string
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

class C {
  toString() {
    dynamic o = new Object();
    return o;
  }
}

main() {
  Expect.throws(() {"1231".replaceAllMapped("1", (m) {
    dynamic c = new C();
    return c.toString();
  });});
}
