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
 * they are  methods, setters, getters, and operators on Object. Test
 * that methods of Object are allowed for the classes Null*`, `dynamic*`, `S?*`,
 * `FutureOr<Null*>`, `FutureOr<dynamic*>`, `FutureOr<FutureOr<S*>>`
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "../../Utils/expect.dart";
import "legacy_lib.dart";

main() {
  var x1 = getLegacyNull();
  Expect.isNotNull(x1.hashCode);
  Expect.isNotNull(x1.toString());
  Expect.isNotNull(x1.runtimeType);
  Expect.isFalse(x1 == new Object());

  var x2 = legacyDynamic;
  Expect.isNotNull(x2.hashCode);
  Expect.isNotNull(x2.toString());
  Expect.isNotNull(x2.runtimeType);
  Expect.isFalse(x2 == new Object());

  var x3 = aLegacy;
  Expect.isNotNull(x3.hashCode);
  Expect.isNotNull(x3.toString());
  Expect.isNotNull(x3.runtimeType);
  Expect.isFalse(x3 == new Object());

  var x4 = futureOrNull;
  Expect.isNotNull(x4.hashCode);
  Expect.isNotNull(x4.toString());
  Expect.isNotNull(x4.runtimeType);
  Expect.isFalse(x4 == new Object());

  var x5 = futureOrDynamic;
  Expect.isNotNull(x5.hashCode);
  Expect.isNotNull(x5.toString());
  Expect.isNotNull(x5.runtimeType);
  Expect.isFalse(x5 == new Object());

  var x6 = futureOrfutureOrS;
  Expect.isNotNull(x6.hashCode);
  Expect.isNotNull(x6.toString());
  Expect.isNotNull(x6.runtimeType);
  Expect.isFalse(x6 == new Object());
}
