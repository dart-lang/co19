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
 * t2 if return types of t1 and t2 are not mutually assignable.
 * @author iefremov
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

class A {}
class B {}

typedef int t1();
typedef A t2();
typedef List<A> t3();
typedef t1 t4();

double f1() {}
bool f2() {}
A f3() {}
List<int> f4() {}
t2 f5() {}
t3 f6() {}

main() {
  Expect.isFalse(f1 is t1);
  Expect.isFalse(f2 is t1);
  Expect.isFalse(f3 is t1);
  Expect.isFalse(f4 is t1);
  Expect.isFalse(f5 is t1);
  Expect.isFalse(f5 is t1);

  Expect.isFalse(f1 is t2);
  Expect.isFalse(f2 is t2);
  Expect.isFalse(f4 is t2);
  Expect.isFalse(f5 is t2);
  Expect.isFalse(f6 is t2);

  Expect.isFalse(f1 is t3);
  Expect.isFalse(f2 is t3);
  Expect.isFalse(f3 is t3);
  Expect.isFalse(f4 is t3);
  Expect.isFalse(f5 is t3);
  Expect.isFalse(f6 is t3);

  Expect.isFalse(f1 is t4);
  Expect.isFalse(f2 is t4);
  Expect.isFalse(f3 is t4);
  Expect.isFalse(f4 is t4);
  Expect.isFalse(f5 is t4);
  Expect.isFalse(f6 is t4);
}
