// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `o` be an object, and let `u` be a fresh final variable bound
/// to o. The closurization of method `f` on object `o` is defined to be
/// equivalent to:
/// ```
/// - <X1 extends B′1, ..., Xs extends B′s>
///     (T1 p1, ..., Tn pn, {Tn+1 pn+1 = d1, ..., Tn+k pn+k = dk}) =>
///       u.m<X1, ..., Xs>(p1, ..., pn, pn+1: pn+1, ..., pn+k: pn+k);
///  ```
///  where `f` is an instance method named `m` which has type parameter
///  declarations `X1 extends B1, ..., Xs extends Bs`, required parameters
///  `p1, ..., pn`, and named parameters `pn+1, ..., pn+k` with defaults
///  `d1, ..., dk`, using `null` for parameters whose default value is not
///  specified.
///
/// @description Check that closurization of an instance method named `m` which
/// has type parameter declarations `X1 extends B1, ..., Xs extends Bs`,
/// required parameters `p1, ..., pn`, and named parameters `pn+1, ..., pn+k`
/// with defaults  `d1, ..., dk` is equivalent to
/// ```
/// <X1 extends B′1, ..., Xs extends B′s>
///     (T1 p1, ..., Tn pn, {Tn+1 pn+1 = d1, ..., Tn+k pn+k = dk}) =>
///       u.m<X1, ..., Xs>(p1, ..., pn, pn+1: pn+1, ..., pn+k: pn+k);
/// ```
/// Test a non-generic case when `m` calls another method.
/// @author sgrekhov@unipro.ru

import '../../../../Utils/expect.dart';

class C {
  double sum(a, b) => a + b;
  double m(double r1, {p1 = 1, num p2 = 2.1, p3}) =>
      sum(r1, p1) * r1 * p1 * p2 * (p3 ?? 1);
}

mixin M {
  double sum(a, b) => a + b;
  double m(double r1, {p1 = 2, num p2 = 2.2, p3}) =>
      sum(r1, p1) * r1 * p1 * p2 * (p3 ?? 1);
}
class MO = Object with M;

enum E {
  e0;

  double sum(a, b) => a + b;
  double m(double r1, {p1 = 3, num p2 = 2.3, p3}) =>
      sum(r1, p1) * r1 * p1 * p2 * (p3 ?? 1);
}

class A {}

extension Ext on A {
  double sum(a, b) => a + b;
  double m(double r1, {p1 = 4, num p2 = 2.4, p3}) =>
      sum(r1, p1) * r1 * p1 * p2 * (p3 ?? 1);
}

extension type ET(int _) {
  double sum(a, b) => a + b;
  double m(double r1, {p1 = 5, num p2 = 2.5, p3}) =>
      sum(r1, p1) * r1 * p1 * p2 * (p3 ?? 1);
}

main() {
  C c = C();
  var fc = c.m;

  var f1 = (double r1, {p1 = 1, num p2 = 2.1, p3}) =>
          c.m(r1, p1: p1, p2: p2, p3: p3);
  Expect.equals(f1(1.14, p1: 2, p2: 3, p3: 4), fc(1.14, p1: 2, p2: 3, p3: 4));
  Expect.equals(f1(2.14), fc(2.14));
  Expect.equals(f1(3.14, p1: 3, p3: null), fc(3.14, p1: 3));
  Expect.equals(f1(4.14, p2: 4.4, p3: null), fc(4.14, p2: 4.4));
  Expect.equals(f1(5.14, p3: 5), fc(5.14, p3: 5));

  M m = MO();
  var fm = m.m;
  var f2 = (double r1, {p1 = 2, num p2 = 2.2, p3}) =>
          m.m(r1, p1: p1, p2: p2, p3: p3);
  Expect.equals(f2(2.14, p1: 4, p2: 5, p3: 6), fm(2.14, p1: 4, p2: 5, p3: 6));
  Expect.equals(f2(3.14), fm(3.14));
  Expect.equals(f2(4.14, p1: 4, p3: null), fm(4.14, p1: 4));
  Expect.equals(f2(5.14, p2: 4.4, p3: null), fm(5.14, p2: 4.4));
  Expect.equals(f2(6.14, p3: 4), fm(6.14, p3: 4));

  var fe = E.e0.m;
  var f3 = (double r1, {p1 = 3, num p2 = 2.3, p3}) =>
          E.e0.m(r1, p1: p1, p2: p2, p3: p3);
  Expect.equals(f3(3.14, p1: 5, p2: 6, p3: 7), fe(3.14, p1: 5, p2: 6, p3: 7));
  Expect.equals(f3(4.14), fe(4.14));
  Expect.equals(f3(5.14, p1: 4, p3: null), fe(5.14, p1: 4));
  Expect.equals(f3(6.14, p2: 4.4, p3: null), fe(6.14, p2: 4.4));
  Expect.equals(f3(7.14, p3: 4), fe(7.14, p3: 4));

  var a = A();
  var fa = a.m;
  var f4 = (double r1, {p1 = 4, num p2 = 2.4, p3}) =>
          a.m(r1, p1: p1, p2: p2, p3: p3);
  Expect.equals(f4(4.14, p1: 4, p2: 5, p3: 6), fa(4.14, p1: 4, p2: 5, p3: 6));
  Expect.equals(f4(5.14), fa(5.14));
  Expect.equals(f4(6.14, p1: 4, p3: null), fa(6.14, p1: 4));
  Expect.equals(f4(7.14, p2: 4.4, p3: null), fa(7.14, p2: 4.4));
  Expect.equals(f4(8.14, p3: 4), fa(8.14, p3: 4));

  var et = ET(0);
  var fet = et.m;
  var f5 = (double r1, {p1 = 5, num p2 = 2.5, p3}) =>
          et.m(r1, p1: p1, p2: p2, p3: p3);
  Expect.equals(f5(5.14, p1: 5, p2: 6, p3: 7), fet(5.14, p1: 5, p2: 6, p3: 7));
  Expect.equals(f5(6.14), fet(6.14));
  Expect.equals(f5(7.14, p1: 4, p3: null), fet(7.14, p1: 4));
  Expect.equals(f5(8.14, p2: 4.4, p3: null), fet(8.14, p2: 4.4));
  Expect.equals(f5(9.14, p3: 4), fet(9.14, p3: 4));
}
