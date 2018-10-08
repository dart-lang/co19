/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws a FormatException if source is not a valid integer literal.
 * @description Check that exception is thrown if String can not be converted
 * to int.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

void checkFE(String string) {
  Expect.throws(() {int.parse(string);}, (e) => e is FormatException);
}

main() {
  checkFE("");
  checkFE("1.0");
  checkFE("1e2");
  checkFE("just string");
  checkFE("1A");
  checkFE("NaN");
  checkFE("Infinity");
  checkFE("1/1");
  checkFE("-");
  checkFE("1 2 ");
  checkFE("12-");
  checkFE("+-1");
}
