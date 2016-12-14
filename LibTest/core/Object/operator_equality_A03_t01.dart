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
 * Symmetric: For all objects o1 and o2, o1 == o2 and o2 == o1 must either both
 * be true, or both be false.
 * ...
 * @description Checks that for all objects o1 and o2, o1 == o2 and o2 == o1 is
 * either both true, or both false.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  const o1 = const Object();
  Object o2 = new Object();
  Object o3 = new Object();
  var o4 = o3;

  Expect.isFalse(o1 == o2);
  Expect.isFalse(o2 == o1);
  Expect.isFalse(o2 == o3);
  Expect.isFalse(o3 == o2);

  Expect.isTrue(o3 == o4);
  Expect.isTrue(o4 == o3);
}
