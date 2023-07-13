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
/// @description Check that run-time type of covariant-by-declaration parameter
/// is `Object?`
/// @author sgrekhov22@gmail.com

import '../../../../Utils/expect.dart';

class A {
  void m1(Object a) {}
  void m2([num a = 0]) {}
  void m3({Object a = 0}) {}
  void m4({required num a}) {}
}

class C extends A {
  void m1(covariant int a) {}
  void m2([covariant int a = 1]) {}
  void m3({covariant int a = 1}) {}
  void m4({required covariant int a}) {}
}

typedef Expected1 = void Function(Object?);
typedef Expected2 = void Function([Object?]);
typedef Expected3 = void Function({Object? a});
typedef Expected4 = void Function({required Object? a});

main() {
  C c = C();
  Expect.equals(Expected1, c.m1.runtimeType);
  Expect.equals(Expected2, c.m2.runtimeType);
  Expect.equals(Expected3, c.m3.runtimeType);
  Expect.equals(Expected4, c.m4.runtimeType);

}
