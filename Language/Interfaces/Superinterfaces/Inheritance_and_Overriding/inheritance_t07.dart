/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We define inherited(J, K) to be
 * the set of members m such that all of the following hold:
 * • m is accessible to K and
 * • A is a direct superinterface of J and either
 * – A declares a member m or
 * – m is a member of inherited(A, K).
 * • m is not overridden by J.
 * ...
 * Otherwise, if the static types T1,...,Tk of the members m1,...,mk are not
 * identical, then there must be a member mx such that Tx <: Ti, 1 ≤ x ≤ k for
 * all i ∈ 1..k, or a static type warning occurs. The member that is inherited
 * is mx, if it exists; otherwise: let numberOf P ositionals(f) denote the
 * number of positional parameters of a function f, and let numberOf
 * RequiredParams(f) denote the number of required parameters of a function f.
 * Furthermore, let s denote the set of all named parameters of the m1,...,mk.
 * Then let
 * h = max(numberOf Positionals(mi)),
 * r = min(numberOf RequiredParams(mi)), i ∈ 1..k.
 * Then I has a method named n, with r required parameters of type dynamic,
 * h positional parameters of type dynamic, named parameters s of type dynamic
 * and return type dynamic.
 * @description Checks there is a compile error in a strong mode if non-abstract
 * class implements several interfaces with same named methods that have
 * different number of required and optional positional formal parameters.
 * @compile-error
 * @author ngl@unipro.ru
 */
import '../../../../Utils/expect.dart';

class A {}
class B extends A {}
class C {}
class D extends C {}

abstract class SI1 {
  void foo(A v1, D v2, [int v3]);
}

abstract class SI2 {
  int foo(B v1, [C v2]);
}

abstract class SI3 {
  int foo(B v1, int v2, bool v3, [C v4]);
}

class I implements SI1, SI2, SI3 {
  dynamic foo(dynamic p1, [dynamic a, dynamic b, dynamic c]) {return 2;}
}

main() {
  I i = new I();
  // We expect that I inherits var foo(var v1, [var v2, var v3, var v4]),
  // so no static warning
  Expect.equals(i.foo(1), 2);
  Expect.equals(i.foo(1, 2), 2);
  Expect.equals(i.foo(1, 2, 3), 2);
  Expect.equals(i.foo(1, 2, 3, 4), 2);
}
