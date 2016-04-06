/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T is more specific than a type S, written T << S, if one
 * of the following conditions is met:
 *  • T is S.
 *  • T is ⊥
 *  • S is dynamic.
 *  • S is a direct supertype of T.
 *  • T is a type parameter and S is the upper bound of T.
 *  • T is a type parameter and S is Object.
 *  • T is of the form I<T1, ..., Tn > and S is of the form I <S1, ..., Sn>
 *    and Ti << Si 1 <= i <= n.
 *  • T and S are both function types, and T << S under the rules of section
 *    (Types/Function Types).
 *  • T is a function type and S is Function.
 *  • T << U and U << S.
 * << is a partial order on types. T is a subtype of S, written T <: S, iff
 * [⊥/Dynamic]T << S.
 * . . .
 * An interface type T may be assigned to a type S, written T <=> S, if either
 * T <: S or S <: T.
 * @description Checks that unrelated types are not subtypes of each other.
 * Performs this check on some "built-in" interfaces (int, String, etc.) and
 * custom ones.
 * @author iefremov
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

class C {}
class D {}

main() {
  Expect.isFalse(1 is String);
  Expect.isFalse(1 is bool);
  Expect.isFalse(1 is List);
  Expect.isFalse(1 is C);
  Expect.isFalse(1 is D);

  Expect.isFalse(new D() is String);
  Expect.isFalse(new D() is double);
  Expect.isFalse(new D() is bool);
  Expect.isFalse(new D() is List);
  Expect.isFalse(new D() is C);
  Expect.isFalse(new D() is int);

  Expect.isFalse(new C() is String);
  Expect.isFalse(new C() is double);
  Expect.isFalse(new C() is bool);
  Expect.isFalse(new C() is List);
  Expect.isFalse(new C() is D);
  Expect.isFalse(new C() is int);

  Expect.isFalse("" is int);
  Expect.isFalse("" is double);
  Expect.isFalse("" is bool);
  Expect.isFalse("" is List);
  Expect.isFalse("" is C);
  Expect.isFalse("" is D);
  Expect.isFalse("" is int);

  Expect.isFalse([] is String);
  Expect.isFalse([] is double);
  Expect.isFalse([] is bool);
  Expect.isFalse([] is int);
  Expect.isFalse([] is C);
  Expect.isFalse([] is D);
  Expect.isFalse([] is int);
}
