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
/// ...
/// - otherwise, if `p` is optional and has a default value whose static type in
///   the empty context is a type `T` which is not `Null` then `p` has declared
///   type `T`. When `T` is `Null`, `p` instead has declared type `Object?`.
///
/// @description Check that if `p` does not have a declared type, but it does
/// have a default value whose static type is `T` which is not `Null` then `p`
/// has the declared type `T`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/static_type_helper.dart';

class C1([var x = 1]);

class C2([final x = 2 as num]);

class C3([var x = 3 as dynamic]);

class C4({final x = 4});

class C5({var x = 5 as Object});

class C6({var x = 6 as dynamic});

extension type ET1([final x = 1]);

extension type ET2([final x = 2 as num]);

extension type ET3([final  x = 3 as dynamic]);

extension type ET4({final x = 4});

extension type ET5({final x = 5 as Object});

extension type ET6({final x = 6 as dynamic});

enum const E1([final x = 1]) {
  e0;
}

enum const E2([final x = 2 as num]) {
  e0;
}

enum const E3([final  x = 3 as dynamic]) {
  e0;
}

enum const E4({final x = 4}) {
  e0;
}

enum const E5({final x = 5 as Object}) {
  e0;
}

enum const E6({final x = 6 as dynamic}) {
  e0;
}

main() {
  C1().x.expectStaticType<Exactly<int>>();
  C2().x.expectStaticType<Exactly<num>>();
  try {
    C3().x.checkDynamic;
  } catch (_) {}
  C4().x.expectStaticType<Exactly<int>>();
  C5().x.expectStaticType<Exactly<Object>>();
  try {
    C6().x.checkDynamic;
  } catch (_) {}

  ET1().x.expectStaticType<Exactly<int>>();
  ET2().x.expectStaticType<Exactly<num>>();
  try {
    ET3().x.checkDynamic;
  } catch (_) {}
  ET4().x.expectStaticType<Exactly<int>>();
  ET5().x.expectStaticType<Exactly<Object>>();
  try {
    ET6().x.checkDynamic;
  } catch (_) {}

  E1.e0.x.expectStaticType<Exactly<int>>();
  E2.e0.x.expectStaticType<Exactly<num>>();
  try {
    E3.e0.x.checkDynamic;
  } catch (_) {}
  E4.e0.x.expectStaticType<Exactly<int>>();
  E5.e0.x.expectStaticType<Exactly<Object>>();
  try {
    E6.e0.x.checkDynamic;
  } catch (_) {}
}
