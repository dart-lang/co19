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
 * @description Check that overriding works as expected in a migrated library -
 * test that nullable class type parameters work as expected ([extends] clause).
 */

import "../../Utils/expect.dart";
import "override_checking_legacy_lib.dart";

class B1<X extends A?> extends B<X> {
  dynamic getParamType() => X;
}

class B2<X extends A> extends B<X> {
  dynamic getParamType() => X;
}

main() {
  B1<A?> b1 = B1<A?>();
  Expect.equals(A, b1.getParamType());

  B1<Null> b2 = B1<Null>();
  Expect.equals(Null, b2.getParamType());

  B1 b3 = B1();
  Expect.equals(A, b3.getParamType());

  B1<A> b4 = B1<A>();
  Expect.equals(A, b4.getParamType());

  B2<A> b5 = B2<A>();
  Expect.equals(A, b5.getParamType());

  B2 b6 = B2();
  Expect.equals(A, b6.getParamType());
}
