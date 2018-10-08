/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String iterableToFullString(Iterable iterable,
 * [String leftDelimiter = '(', String rightDelimiter = ')'])
 * Handles circular references where converting one of the elements to a string
 * ends up converting iterable to a string again.
 * @description Checks that IterableBase.iterableToFullString() replaces the
 * circular references with '[...]' substrings.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  List l1 = [1, 2, 3];
  List l2 = [4, 5];

  l1.add(l2);
  Expect.equals("(1, 2, 3, [4, 5])", IterableBase.iterableToFullString(l1));

  l1.add(l1);
  Expect.equals("(1, 2, 3, [4, 5], [...])",
      IterableBase.iterableToFullString(l1));

  l1.add(l1);
  Expect.equals("(1, 2, 3, [4, 5], [...], [...])",
      IterableBase.iterableToFullString(l1));

  l2.add(l1);
  Expect.equals("(1, 2, 3, [4, 5, [...]], [...], [...])",
      IterableBase.iterableToFullString(l1));

  l2.add(l2);
  Expect.equals("(1, 2, 3, [4, 5, [...], [...]], [...], [...])",
      IterableBase.iterableToFullString(l1));
}
