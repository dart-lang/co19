/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String operator +(String other)
 * Creates a new string by concatenating this string with other.
 * @description Checks that this operator creates a new string by concatenating
 * this string with other.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals("dart", "d" + "a" + "r" + "t");
  Expect.equals("\\d\\a", "\\d" + "\\a");
  Expect.equals(r"\dart", r"\d" + "art");
}
