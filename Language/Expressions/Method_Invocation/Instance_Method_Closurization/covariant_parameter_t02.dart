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
/// @description Check that run-time type of covariant-by-class parameter is
/// `Object?`
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
  Expect.isTrue(c.m1 is void Function(Object?));
  Expect.isTrue(c.m2 is void Function([Object?]));
  Expect.isTrue(c.m3 is void Function({Object? a}));
  Expect.isTrue(c.m4 is void Function({required Object? a}));
}
