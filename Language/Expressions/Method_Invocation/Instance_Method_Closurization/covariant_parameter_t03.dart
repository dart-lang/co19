// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let o be an object, and let u be a fresh final variable bound to
/// o. The closurization of method f on object o is defined to be equivalent to:
/// • <X1 extends B′1, . . . , Xs extends B′s>
///     (T1 p1, . . . , Tn pn, {Tn+1 pn+1 = d1, . . . , Tn+k pn+k = dk}) =>
///       u.m<X1, . . . , Xs>(p1, . . . , pn, pn+1: pn+1, . . . , pn+k: pn+k);
/// where f is an instance method named m which has type parameter declarations
/// X1 extends B1, . . . , Xs extends Bs, required parameters p1, . . . , pn,
/// and named parameters pn+1, . . . , pn+k with defaults d1, . . . , dk.
///
/// • <X1 extends B′1, . . . , Xs extends B′s>
///   (T1 p1, . . . , Tn pn, [Tn+1 pn+1 = d1, . . . , Tn+k pn+k = dk]) =>
///     u.m<X1, . . . , Xs>(p1, . . . , pn+k);
/// where f is an instance method named m which has type parameter declarations
/// X1 extends B1, . . . , Xs extends Bs, required parameters p1, . . . , pn,
/// and optional positional parameters pn+1, . . . , pn+k with defaults
/// d1, . . . , dk.
/// ...
/// For each parameter pj , j ∈ 1..n + k, if pj is covariant then Tj is the
/// built-in class Object?.
///
/// @description Check that it is a run-time error if the run-time type of the
/// actual argument passed to a covariant-by-class parameter is not a subtype of
/// the declared type of that parameter
/// @author sgrekhov22@gmail.com

import '../../../../Utils/expect.dart';

class C<T> {
  void m1(T a) {}
  void m2([T? a]) {}
  void m3({T? a}) {}
  void m4({required T a}) {}
}

main() {
  C<int> c = C<int>();
  dynamic d1 = c.m1;
  Expect.throws(() {
    d1(Object());
  });
  d1(42);
  dynamic d2 = c.m2;
  Expect.throws(() {
    d2(Object());
  });
  d2(42);
  dynamic d3 = c.m3;
  Expect.throws(() {
    d3(a: Object());
  });
  d3(a: 42);
  dynamic d4 = c.m4;
  Expect.throws(() {
    d4(a: Object());
  });
  d4(a: 42);
}
