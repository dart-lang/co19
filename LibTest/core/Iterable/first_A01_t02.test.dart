/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E first
 * Returns the first element.
 * Throws a StateError if this is empty. Otherwise returs the first element
 * in the iteration order, equivalent to (iterator..moveNext())..current.
 * @description Checks that the first element of the list is returned.
 * @author kaigorodov
 * @author sgrekhov@unipro.ru
 */
library first_A01_t02;
import "../../../Utils/expect.dart";

test(Iterable create([Iterable content]), {bool isSet: false}) {
  const head = -1;
  Iterable a = create();
  Expect.equals(0, a.length);
  a = create([head]);
  Expect.equals(head, a.first);
  if (!isSet) {
    a = create([head, 1]);
    Expect.equals(head, a.first);

    List b = new List(1000);
    b[0] = head;
    b[999] = "top";
    a = create(b);
    Expect.equals(head, a.first);

    a = create([-2, 0, "0", false, -1]);
    Expect.equals(-2, a.first);

    a = create([0, null, "0", false]);
    Expect.equals(0, a.first);
  } else {
    // Set may be unordered so the first element is unpredictable
    // just test that something is returned
    a = create([head, 1]);
    Expect.isNotNull(a.first);

    a = create([-2, 0, 0, false, -1]);
    Expect.isNotNull(a.first);

    a = create([0, 0.5, 0, false]);
    Expect.isNotNull(a.first);
  }
}
