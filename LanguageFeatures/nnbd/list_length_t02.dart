/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Calling the .length setter on a List with element type E with an
 * argument greater than the current length of the list is a runtime error
 * unless Null <: E
 * @description Check that calling the .length setter on a List with element
 * type E with an argument greater than the current length of the list is a
 * runtime error if E is not subtype of Null
 * @author sgrekhov@unipro.ru
 * @issue 39777
 */
// SharedOptions=--enable-experiment=non-nullable
import "legacy_lib.dart";
import "dart:async";
import "../../Utils/expect.dart";

class A {}

test<T>(T t1, T t2) {
  List<T> list = [t1, t2];
  Expect.throws(() {
    list.length = 3;
  });
}

main() {
  test<A>(A(), A());
  test<LegacyFoo>(fLegacy1, fLegacy2);
  test<FutureOr<A>>(A(), A());
  test<FutureOr<LegacyFoo>>(fLegacy2, fLegacy2);
  test<FutureOr<FutureOr<A>>>(A(), A());
}
