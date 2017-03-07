/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
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
 * @description Checks that for all not equal objects o1 and o2, o1 == o2 and
 * o2 == o1 is both false
 * @author a.semenov@unipro.ru
 */
library operator_equality_A03_t03;
import "../../../Utils/expect.dart";

test(List<Object> createNotEqual(int number)) {

  List<Object> objects = createNotEqual(2);

  Expect.isFalse(objects[0] == objects[1]);
  Expect.isFalse(objects[1] == objects[0]);
}
