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
  double n(int r1, int r2, double r3, p1, p2, p3) {
    return r1 * r2 * r3 * p1 * p2 * (p3 ?? 1);
  }

  int sum(a, b) => a + b;

  double m(int r1, int r2, double r3, [p1 = 2, p2 = -3, p3]) {
    return sum(r1, p1) * n(r1, r2, r3, p1, p2, p3);
  }
}

main() {
  C o = new C();
  var f = o.m;

  var f1 = (int r1, int r2, double r3, [p1 = 2, p2 = -3, p3]) {
    return o.m(r1, r2, r3, p1, p2, p3);
  };

  Expect.equals(f(1, 2, 3.2, 4, 5, 6), f1(1, 2, 3.2, 4, 5, 6));
  Expect.equals(f(2, 3, 8.5, 2, -3, null), f1(2, 3, 8.5));
  Expect.equals(f(-1, 3, 9.1, 4), f1(-1, 3, 9.1, 4));
  Expect.equals(f(-1, 3, 9.1, 4, 5), f1(-1, 3, 9.1, 4, 5));
}
