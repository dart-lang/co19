/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String iterableToFullString(Iterable iterable,
 * [String leftDelimiter = '(', String rightDelimiter = ')'])
 * Unlike [iterableToShortString], this conversion doesn't omit any elements or
 * puts any limit on the size of the result.
 * @description Checks that IterableBase.iterableToFullString() converts each
 * elements to a string, even if result string is very long
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  String expected = "";
  List l = new List<int>();
  for (int i = -300; i <= 300; i++) {
    l.add(i);
    expected += i.toString();
    if (i != 300) {
      expected += ", ";
    }
  }
  expected = "(" + expected + ")";
  Expect.equals(expected, IterableBase.iterableToFullString(l));
}
