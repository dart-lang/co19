/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract E elementAt(int index)
 * If [this] [Iterable] has fewer than index elements throws a RangeError.
 * @description Checks that a RangeError is thrown if this list  has fewer than index elements.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

var v;

void check (List a, int index) {
  try {
     v=a.elementAt(index);
     Expect.fail("no error thrown");
  } on RangeError catch (ok) {
  } catch (bad) {
     Expect.fail("RangeError expected, but $bad thrown");
  }
}

main() {
  List a=[5, 4, 3, 2, 1, 0];
  check(a, -1);
  check(a, a.length);
  check(a, a.length+1);
  check(a, a.length*2);
  check(a, 1000000000);
}
