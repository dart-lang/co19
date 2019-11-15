/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error to call a method, setter, getter or operator on
 * an expression whose type is potentially nullable and not dynamic, except for
 * the methods, setters, getters, and operators on Object.
 *
 * @description Check that it is no compile-time error to call a method, setter,
 * getter or operator on an expression whose type is potentially nullable if
 * they are  methods, setters, getters, and operators on Object. Test some class
 * A?
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "../../Utils/expect.dart";

class A {}

main() {
  A? a = new A();
  Expect.isNotNull(a.hashCode);
  Expect.isNotNull(a.toString());
  Expect.isNotNull(a.runtimeType);
  Expect.isFalse(a == new A());
}
