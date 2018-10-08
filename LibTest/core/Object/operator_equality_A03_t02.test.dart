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
 * @description Checks that for all equal objects o1 and o2, o1 == o2 and
 * o2 == o1 is both true
 * @author a.semenov@unipro.ru
 */
library operator_equality_A03_t02;
import "../../../Utils/expect.dart";

test(List<Object> createEqual(int number)) {

  List<Object> objects = createEqual(2);

  Expect.isTrue(objects[0] == objects[1]);
  Expect.isTrue(objects[1] == objects[0]);
}
