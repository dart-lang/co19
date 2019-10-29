/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In a migrated library, override checking must check that an
 * override is consistent with all overridden methods from other migrated
 * libraries in the super-interface chain, since a legacy library is permitted
 * to override otherwise incompatible signatures for a method.
 *
 * @description Check that overriding works as expected in a migrated library -
 * test that nullable class type parameters work as expected (check case when
 * class implements two classes with the same method names).
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable

import "../../Utils/expect.dart";
import "override_checking_legacy_lib.dart";

abstract class DD<X extends A?> {}

class D1<X extends A?> implements D<X>, DD<X> {
  dynamic getParamType() => X;
}

main() {
  D1<A?> d1 = D1<A?>();
  Expect.equals(A, d1.getParamType());

  D1<Null> d2 = D1<Null>();
  Expect.equals(Null, d2.getParamType());

  D1 d3 = D1();
  Expect.equals(A, d3.getParamType());

  D1<A> d4 = D1<A>();
  Expect.equals(A, d4.getParamType());
}
