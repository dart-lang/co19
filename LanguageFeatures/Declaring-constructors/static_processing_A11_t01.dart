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
/// Assume that `p` is an formal parameter in `D` which has the modifier `var`
/// or the modifier `final` (that is, p is a declaring parameter).
///
/// Assume that the combined member signature for a getter with the same name as
/// `p` from the superinterfaces of `D` exists, and has return type `T`. In that
/// case the parameter `p` has declared type `T` as well.
///
/// @description Check that if the combined member signature for a getter with
/// the same name as `p` from the superinterfaces of `D` exists, and has return
/// type `T` then the parameter `p` has declared type `T` as well.
/// @author sgrekhov22@gmail.com

// TODO (sgrekhov) Add `declaring-constructors` experimental flag

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

main() {
  C1().x.expectStaticType<Exactly<num>>();
  C1().y.expectStaticType<Exactly<num>>();
  C2().x.expectStaticType<Exactly<num>>();
  C2().y.expectStaticType<Exactly<num>>();
  C3().x.expectStaticType<Exactly<num>>();
  C3().y.expectStaticType<Exactly<num>>();
  C4().x.expectStaticType<Exactly<num>>();
  C4().y.expectStaticType<Exactly<num>>();
  C5().x.expectStaticType<Exactly<num>>();
  C5().y.expectStaticType<Exactly<num>>();
  C6().x.expectStaticType<Exactly<num>>();
  C6().y.expectStaticType<Exactly<num>>();
}
