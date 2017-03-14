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
library operator_equality_A04_t01;
import "../../../Utils/expect.dart";

test(List<Object>createEqual(int number)) {
  List<Object> o = createEqual(3);

  Expect.isTrue(o[0] == o[1]);
  Expect.isTrue(o[1] == o[2]);
  Expect.isTrue(o[0] == o[2]);
}
