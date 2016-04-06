/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A function type (T1,...Tk,[Tk+1,...,Tn+m]) -> T is a subtype of
 * the function type (S1,...,Sk+j,[Sk+j+1,...,Sn]) -> S, if all of the following
 * conditions are met:
 * 1. Either
 *    • S is void, or
 *    • T <=> S.
 * 2. ∀i ∈ 1..n, Ti ⇐⇒ Si.
 * @description Checks that function type t1 is not a subtype of function type
 * t2 even if just one of its formal parameters has a type that is not mutually
 * assignable with the type of the corresponding formal parameter of t2.
 * @author iefremov
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

abstract class B {}

typedef B func(Object o);
typedef B t1(int i, B b, Map<int, num> m, var x);

B f1(double i, B b, Map<int, num> m, var x) {}
//    ^^^ double <=/=> int
B f2(int i, func b, Map<int, num> m, var x) {}
//           ^^^ func <=/=> B
B f3(int i, B b, Map<int, func> m, var x) {}
//                         ^^^ func <=/=> num

main() {
  Expect.isFalse(f1 is t1);
  Expect.isFalse(f2 is t1);
  Expect.isFalse(f3 is t1);
}
