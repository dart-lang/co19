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
import "../../../Utils/expect.dart";

check(List a, Object value, bool expected) {
  var l1=a.length;
  bool r = a.remove(value);
  Expect.isTrue(r is bool, "remove returned: ${r.runtimeType} ${r}, not bool");
  if (r) {
     Expect.isTrue(expected);
     Expect.equals(l1-1, a.length);
  } else {
     Expect.isFalse(expected);
     Expect.equals(l1, a.length);
  }
}

main() {
  check([], 1, false);
  check([1], 1, true);
  check(new List.from([]), true, false);
  List a=new List();
  check(a, 2, false);
  a.add(2);
  check(a, 2, true);
  check(a, 2, false);
}
