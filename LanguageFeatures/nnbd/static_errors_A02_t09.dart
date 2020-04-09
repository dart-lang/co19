/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error to read a field or tear off a method from an
 * expression whose type is potentially nullable and not dynamic, except for the
 * methods and fields on Object.
 *
 * @description Check that it is no compile-time error to read a field or tear
 * off a method from an expression whose type is potentially nullable if they
 * are  methods, setters, getters, and operators on Object. Test that methods
 * of Object are allowed for the classes Null*`, `dynamic*`, `S?*`,
 * `FutureOr<Null*>`, `FutureOr<dynamic*>`, `FutureOr<FutureOr<S*>>`
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "../../Utils/expect.dart";
import "legacy_lib.dart";

main() {
  var x1 = getLegacyNull();
  Expect.isNotNull(x1.toString);

  var x2 = legacyDynamic;
  Expect.isNotNull(x2.toString);

  var x3 = aLegacy;
  Expect.isNotNull(x3.toString);

  var x4 = futureOrNull;
  Expect.isNotNull(x4.toString);

  var x5 = futureOrDynamic;
  Expect.isNotNull(x5.toString);

  var x6 = futureOrfutureOrS;
  Expect.isNotNull(x6.toString);
}
