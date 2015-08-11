/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T is more specific than a type S, written T << S, if T is a type parameter and S is the upper bound of T.
 * << is a partial order on types. T is a subtype of S, written T <: S, iff [⊥/Dynamic]T << S.
 * A type T may be assigned to a type S, written T <=> S, if either T <: S or S <: T.
 * @description Checks assignability (no static warnings) of S and T where T is type parameter and S is it's upper bound.
 * Note: detailed checks are contained in tests for the next assertion.
 * @static-clean
 * @author iefremov
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

class Super {}

class Mid extends Super {}

class Sub extends Mid {}

class Checker<T extends Super> {
  Checker(T t) {
    Expect.isTrue(t is Super);
    Super ss = t;
    Super f() {}
    T tt = f();
  }
}

main() {
  new Checker<Sub>(new Sub());
}
