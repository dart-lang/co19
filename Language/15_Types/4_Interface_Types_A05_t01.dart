/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T is more specific than a type S, written T << S, if T is S.
 * << is a partial order on types. T is a subtype of S, written T <: S, iff [⊥/Dynamic]T << S.
 * A type T may be assigned to a type S, written T <=> S, if either T <: S or S <: T.
 * @description Trivially checks that non-generic type T is a subtype of itself and
 * T is assignable to itself.
 * @author iefremov
 * @reviewer rodionov
 */
import "../../Utils/expect.dart";

class A {
}

main() {
  A a = new A();
  Expect.isTrue(a is A);
  A b = a;
  a = new A();
}
