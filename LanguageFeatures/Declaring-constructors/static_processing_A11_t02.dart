// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The following applies to both the header and the body form of
/// declaring constructors.
///
/// The semantics of the declaring constructor is found in the following steps,
/// where `D` is the class, extension type, or enum declaration in the program
/// that includes a declaring constructor, and `D2` is the result of the
/// derivation of the semantics of `D`. The derivation step will delete elements
/// that amount to the declaring constructor; it will add a new constructor `k`;
/// and it will add zero or more instance variable declarations.
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
///   parameter `p` has declared type `T`.
///
/// @description Check that if the combined member signature for a setter with
/// the same basename as `p` from the superinterfaces of `D` exists, and has a
/// formal parameter type `T` then the parameter `p` has declared type `T` as
/// well.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

import '../../Utils/static_type_helper.dart';

class A {
  void set x(num x) {}
  void set y(num x) {}
}

class C1(var x, [var y = 1]) extends A;

class C2(final x, [final y = 2]) extends A;

class C3(final x, {final y = 1}) extends A;

class C4(var x, {var y = 2}) extends A;

class C5(final x, {required final y}) extends A;

class C6(var x, {required var y}) extends A;

main() {
  C1(1).x.expectStaticType<Exactly<num>>();
  C1(1).y.expectStaticType<Exactly<num>>();
  C2(2).x.expectStaticType<Exactly<num>>();
  C2(2).y.expectStaticType<Exactly<num>>();
  C3(3).x.expectStaticType<Exactly<num>>();
  C3(3).y.expectStaticType<Exactly<num>>();
  C4(4).x.expectStaticType<Exactly<num>>();
  C4(4).y.expectStaticType<Exactly<num>>();
  C5(5, y: 5).x.expectStaticType<Exactly<num>>();
  C5(5, y: 5).y.expectStaticType<Exactly<num>>();
  C6(6, y: 6).x.expectStaticType<Exactly<num>>();
  C6(6, y: 6).y.expectStaticType<Exactly<num>>();
}
