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
 * @description  Check that it is no compile-time error to call a method, setter,
 * getter or operator on an expression whose type is potentially nullable if
 * they are  methods, setters, getters, and operators on Object. Test
 * that methods of Object are allowed for the type <T* extends int?>
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "legacy_lib.dart";
import "../../Utils/expect.dart";

main() {
  B<int?> b = new B<int?>(42);
  Expect.isNotNull(b.x.hashCode);
  Expect.isNotNull(b.x.toString());
  Expect.isNotNull(b.x.runtimeType);
  Expect.isFalse(b.x == new Object());
}
