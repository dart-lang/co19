/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String replaceFirstMapped(Pattern from,
 * String replace(Match match), [int startIndex = 0])
 * ...
 * If the value returned by calling replace is not a String, it is converted to
 * a String using its toString method, which must then return a string.
 * @description Checks that if the value returned by calling replace is not a
 * String, it is converted to a String using its toString method
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

class C {
  String toString() {
    return "C";
  }
}

main() {
  Expect.equals("C23", "123".replaceFirstMapped("1", (m) {
    dynamic c = new C();
    return c.toString();
  }));
}
