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
/// ...
/// - otherwise, if `p` is optional and has a default value whose static type in
///   the empty context is a type `T` which is not `Null` then `p` has declared
///   type `T`. When `T` is `Null`, `p` has declared type `Object?`.
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
}
