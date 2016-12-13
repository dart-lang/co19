/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool operator ==(other)
 * The equality operator.
 *
 * The default behavior for all Objects is to return true if and only if this
 * and other are the same object.
 *
 * Override this method to specify a different equality relation on a class.
 * The overriding method must still be an equivalence relation. That is, it must
 * be:
 * ...
 * Transitive: For all objects o1, o2, and o3, if o1 == o2 and o2 == o3 are
 * true, then o1 == o3 must be true.
 * ...
 * @description Checks that for all objects o1, o2, and o3, if o1 == o2 and
 * o2 == o3 are true, then o1 == o3 is also true.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

class C {
  var m;
  C(this.m);
}

main() {
  Object o1 = new Object();
  Object o2 = o1;
  Object o3 = o1;

  Expect.isTrue(o1 == o2);
  Expect.isTrue(o2 == o3);
  Expect.isTrue(o1 == o3);
}
