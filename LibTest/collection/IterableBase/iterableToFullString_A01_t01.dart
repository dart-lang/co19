/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String iterableToFullString(Iterable iterable,
 * [String leftDelimiter = '(', String rightDelimiter = ')'])
 * Converts an Iterable to a string.
 * Converts each elements to a string, and separates the results by ", ". Then
 * wraps the result in leftDelimiter and rightDelimiter.
 * Unlike iterableToShortString, this conversion doesn't omit any elements or
 * puts any limit on the size of the result.
 * Handles circular references where converting one of the elements to a string
 * ends up converting iterable to a string again.
 * @description Checks that IterableBase.iterableToFullString() converts each
 * elements to a string, and separates the results by ", ".
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  String expected = "";
  List<int> l = new List<int>();
  for (int i = -100; i <= 100; i++) {
    l.add(i);
    expected += i.toString();
    if (i != 100) {
      expected += ", ";
    }
  }
  expected = "(" + expected + ")";
  Expect.equals(expected, IterableBase.iterableToFullString(l));
}
