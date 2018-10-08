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
 * Reflexive: For all objects o, o == o must be true.
 * ...
 * @description Checks that object is equal to itself
 * @author a.semenov@unipro.ru
 */
library operator_equality_A02_t02;
import "../../../Utils/expect.dart";

test(Object create()) {
  Object o = create();
  Expect.isTrue(o == o);
}
