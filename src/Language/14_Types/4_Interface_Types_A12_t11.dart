/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T is more specific than a type S, written T << S, if one of the following conditions is met:
 *   - T is S.
 *   - T is ⊥
 *   - S is Dynamic.
 *   - S is a direct supertype of T.
 *   - T is a type variable and S is the upper bound of T.
 *   - T is of the form I<T1, ..., Tn > and S is of the form I <S1, ..., Sn> and Ti << Si 1 <= i <= n.
 *   - T << U and U << S.
 * T is a subtype of S, written T <: S, iff [⊥/Dynamic]T << S.
 * A type T may be assigned to a type S, written T <=> S, if either T <: S or S <: T .
 * @description Checks that type t1 that is more specific than t2 is not a supertype of t2 (t1 and t2 are
 * non-generic interface types).
 * @author iefremov
 * @reviewer rodionov
 */
import "../../Utils/expect.dart";

class B {}
class C extends B {}
class D extends C {}

main() {
  Expect.isFalse(new Object() is B);
  Expect.isFalse(new Object() is C);
  Expect.isFalse(new Object() is D);
  Expect.isFalse(new Object() is int);
  Expect.isFalse(new Object() is Function);
  Expect.isFalse(new Object() is bool);
  Expect.isFalse(new Object() is num);

  Expect.isFalse(new C() is D);
  Expect.isFalse(new B() is D);
  Expect.isFalse(new B() is C);
}
