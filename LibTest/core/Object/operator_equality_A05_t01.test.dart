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
 * ...
 *    The method should also be consistent over time, so equality of two
 * objects should not change over time, or at least only change if one of
 * the objects was modified.
 * ...
 * @description Checks that for all equal objects o1 and o2, equality is
 * constant in time
 *
 * @author a.semenov@unipro.ru
 */
library operator_equality_A05_t01;
import "../../../Utils/expect.dart";

test(List<Object> createEqual(int number)) {

  List<Object> objects = createEqual(2);
  for (int i = 0; i < 10; i++) {
    Expect.isTrue(objects[0] == objects[1]);
  }
}
