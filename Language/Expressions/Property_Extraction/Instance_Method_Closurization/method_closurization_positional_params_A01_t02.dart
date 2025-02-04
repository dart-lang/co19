// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Check that closurization of an instance method named `m` which
/// has type parameter declarations `X1 extends B1, ..., Xs extends Bs`,
/// required parameters `p1, ..., pn`, and optional positional parameters
/// `pn+1, ..., pn+k` with defaults  `d1, ..., dk` is equivalent to
/// ...
/// ```
/// - <X1 extends B′1, ..., Xs extends B′s>
///     (T1 p1, ..., Tn pn, [Tn+1 pn+1 = d1, ..., Tn+k pn+k = dk]) =>
///       u.m<X1, ..., Xs>(p1, ..., pn+k);
/// ```
/// Test a non-generic case when `m` calls another method.
/// @author sgrekhov@unipro.ru

import '../../../../Utils/expect.dart';

class C {
  double sum(a, b) => a + b;
  double m(double r1, [p1 = 1, num p2 = 2.1, p3]) {
    return sum(r1, p1) * r1 * p1 * p2 * (p3 ?? 1);
  }
}

mixin M {
  double sum(a, b) => a + b;
  double m(double r1, [p1 = 2, num p2 = 2.2, p3]) {
    return sum(r1, p1) * r1 * p1 * p2 * (p3 ?? 1);
  }
}
class MO = Object with M;

enum E {
  e0;
  double sum(a, b) => a + b;
  double m(double r1, [p1 = 3, num p2 = 2.3, p3]) {
    return sum(r1, p1) * r1 * p1 * p2 * (p3 ?? 1);
  }
}

class A {}

extension Ext on A {
  double sum(a, b) => a + b;
  double m(double r1, [p1 = 4, num p2 = 2.4, p3]) {
    return sum(r1, p1) * r1 * p1 * p2 * (p3 ?? 1);
  }
}

extension type ET(int _) {
  double sum(a, b) => a + b;
  double m(double r1, [p1 = 5, num p2 = 2.5, p3]) {
    return sum(r1, p1) * r1 * p1 * p2 * (p3 ?? 1);
  }
}

main() {
  C c = C();
  var fc = c.m;
  var f1 = (double r1, [p1 = 1, num p2 = 2.1, p3]) => c.m(r1, p1, p2, p3);
  Expect.equals(f1(1.14, 2, 3, 4), fc(1.14, 2, 3, 4));
  Expect.equals(f1(2.14), fc(2.14));
  Expect.equals(f1(3.14, 3, 4), fc(3.14, 3, 4));
  Expect.equals(f1(4.14, 4, 4.4, null), fc(4.14, 4, 4.4));

  M m = MO();
  var fm = m.m;
  var f2 = (double r1, [p1 = 2, num p2 = 2.2, p3]) => m.m(r1, p1, p2, p3);
  Expect.equals(f2(1.14, 2, 3, 4), fm(1.14, 2, 3, 4));
  Expect.equals(f2(2.14), fm(2.14));
  Expect.equals(f2(3.14, 3, 4), fm(3.14, 3, 4));
  Expect.equals(f2(4.14, 4, 4.4, null), fm(4.14, 4, 4.4));

  var fe = E.e0.m;
  var f3 = (double r1, [p1 = 3, num p2 = 2.3, p3]) => E.e0.m(r1, p1, p2, p3);
  Expect.equals(f3(1.14, 2, 3, 4), fe(1.14, 2, 3, 4));
  Expect.equals(f3(2.14), fe(2.14));
  Expect.equals(f3(3.14, 3, 4), fe(3.14, 3, 4));
  Expect.equals(f3(4.14, 4, 4.4, null), fe(4.14, 4, 4.4));

  var a = A();
  var fa = a.m;
  var f4 = (double r1, [p1 = 4, num p2 = 2.4, p3]) => m.m(r1, p1, p2, p3);
  Expect.equals(f4(1.14, 2, 3, 4), fa(1.14, 2, 3, 4));
  Expect.equals(f4(2.14), fa(2.14));
  Expect.equals(f4(3.14, 3, 4), fa(3.14, 3, 4));
  Expect.equals(f4(4.14, 4, 4.4, null), fa(4.14, 4, 4.4));

  var et = ET(0);
  var fet = et.m;
  var f5 = (double r1, [p1 = 5, num p2 = 2.5, p3]) => et.m(r1, p1, p2, p3);
  Expect.equals(f5(1.14, 2, 3, 4), fet(1.14, 2, 3, 4));
  Expect.equals(f5(2.14), fet(2.14));
  Expect.equals(f5(3.14, 3, 4), fet(3.14, 3, 4));
  Expect.equals(f5(4.14, 4, 4.4, null), fet(4.14, 4, 4.4));
}
