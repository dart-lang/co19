// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The semantics of the primary constructor is found in the
/// following steps, where `D` is the class, mixin class, extension type, or
/// enum declaration in the program that includes a primary constructor `k`, and
/// `D2` is the result of the derivation of the semantics of `D`. The derivation
/// step will delete elements that amount to the primary constructor.
/// Semantically, it will add a new constructor `k2`, and it will add zero or
/// more instance variable declarations.
///
/// Where no processing is mentioned below, `D2` is identical to `D`. Changes
/// occur as follows:
///
/// Let `p` be a formal parameter in `k` which has the modifier `var` or the
/// modifier `final` (that is, `p` is a declaring parameter).
///
/// Consider the situation where `p` has no type annotation:
/// - if combined member signature for a getter with the same name as `p` from
///   the superinterfaces of `D` exists and has return type `T`, the parameter
///   `p` has declared type `T`. If no such getter exists, but a setter with the
///   same basename exists, with a formal parameter whose type is `T`, the
///   parameter `p` has declared type `T`. In other words, an instance variable
///   introduced by a declaring parameter is subject to override inference, just
///   like an explicitly declared instance variable.
///
/// @description Check that if the combined member signature for a getter with
/// the same name as `p` from the superinterfaces of `D` exists, and has return
/// type `T` then the parameter `p` has declared type `T` as well.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/static_type_helper.dart';

class A1 {
  final num x = 0;
  final num y = 0;
}

class A2 {
  num get x => 0;
  num get y => 0;
}

class A3 {
  num x = 0;
  num y = 0;
}

class C1(var x, [var y = 1]) extends A1;

class C2(final x, [final y = 2]) extends A2;

class C3(var x, [var y = 3]) extends A3;

class C4(final x, {final y = 1}) extends A1;

class C5(var x, {var y = 2}) extends A2;

class C6(final x, {final y = 3}) extends A3;

class C7(var x, {required var y}) extends A1;

class C8(final x, {required final y}) extends A2;

main() {
  C1(1).x.expectStaticType<Exactly<num>>();
  C1(1).y.expectStaticType<Exactly<num>>();
  C2(2).x.expectStaticType<Exactly<num>>();
  C2(2).y.expectStaticType<Exactly<num>>();
  C3(3).x.expectStaticType<Exactly<num>>();
  C3(3).y.expectStaticType<Exactly<num>>();
  C4(4).x.expectStaticType<Exactly<num>>();
  C4(4).y.expectStaticType<Exactly<num>>();
  C5(5).x.expectStaticType<Exactly<num>>();
  C5(5).y.expectStaticType<Exactly<num>>();
  C6(6).x.expectStaticType<Exactly<num>>();
  C6(6).y.expectStaticType<Exactly<num>>();
  C7(7, y: 7).x.expectStaticType<Exactly<num>>();
  C7(7, y: 7).y.expectStaticType<Exactly<num>>();
  C8(8, y: 8).x.expectStaticType<Exactly<num>>();
  C8(8, y: 8).y.expectStaticType<Exactly<num>>();
}
