/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String iterableToShortString(Iterable iterable,
 * [String leftDelimiter = '(', String rightDelimiter = ')'])
 * Convert an [Iterable] to a string like [IterableBase.toString].
 * @description Checks that result returned by
 * [IterableBase.iterableToShortString()] is shorter than result returned by
 * [IterableBase.iterableToFullString()].
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
  Expect.isTrue(IterableBase.iterableToFullString(l).length >=
      IterableBase.iterableToShortString(l).length);
}
