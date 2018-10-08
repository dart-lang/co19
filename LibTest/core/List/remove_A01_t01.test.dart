/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract bool remove(Object value)
 * Removes value from the list. Returns true if value was in the list. Returns
 * false otherwise. The method has no effect if value value was not in the list.
 * @author kaigorodov
 */
library remove_A01_t01;

import "../../../Utils/expect.dart";

test(List create([int length])) {

  check(List a0, Object value, bool expected) {
    List a = create();
    a.addAll(a0);
  
    bool r = a.remove(value);
    Expect.isTrue(r is bool, "remove returned: ${r.runtimeType} ${r}, not bool");
    if (r) {
      Expect.isTrue(expected);
      Expect.equals(a0.length-1, a.length);
    } else {
      Expect.isFalse(expected);
      Expect.equals(a0.length, a.length);
    }
  }

  check([], 1, false);
  check([1], 1, true);
  check(new List.from([]), true, false);
  List a = new List();
  check(a, 2, false);
  a.add(2);
  check(a, 2, true);
}
