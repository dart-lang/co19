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
 * @description Checks that there's no static warning produced when the
 * subinterface member being accessed is actually inherited. Members tested
 * include variables, methods, getters, setters and operators. There's no way
 * to check whether the resulting inherited method signature is actually as
 * described above, but we can check that it's inherited at all.
 * @static-clean
 * @author rodionov
 */
import '../../../../Utils/expect.dart';

class C {}
class D extends C {}

abstract class SI1 {
  int method(num v, String p, {int o1, Pattern o2});
  int method2(C v, [D o]);
  int get gett0r;
  void set sett0r(int v);
  C operator +(C v);
}

abstract class SI2 {
  void method(num v, String p, {int o1, Pattern o2});
  num method2(C v, [D o]);
  num get gett0r;
  void set sett0r(num v);
  C operator +(C v);
}

abstract class I implements SI1, SI2 {}

main() {
  I i = null;

  Expect.throws(() {i.method(null, null, o1:null, o2:null);}, (e) => e is NoSuchMethodError);
  Expect.throws(() {var v = i.method2(null, null);}, (e) => e is NoSuchMethodError);
  Expect.throws(() {num n = i.gett0r;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {i.sett0r = null;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {var v = i + null;}, (e) => e is NoSuchMethodError);
}
