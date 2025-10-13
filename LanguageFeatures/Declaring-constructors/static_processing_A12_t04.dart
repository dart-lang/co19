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
/// - otherwise, if `p` does not have a default value then `p` has declared type
///   `Object?`.
///
/// @description Check that if `p` does not have a declared type and its default
/// value is `Null` or absent then the declared type of `p` is `Object?` not
/// `dynamic`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

class C1(var x, [var y]);

class C2(final x, [final y]);

class C3([var x = null]);

class C4([final x = null]);

class C5(final x, {final y});

class C6(var x, {var x});

class C7({final x = null});

class C8({var x = null});

main() {
  C1(1).x.checkDynamic;
//        ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  C1(1).y.checkDynamic;
//        ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  C2().x.checkDynamic;
//       ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  C2().y.checkDynamic;
//       ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  C3().x.checkDynamic;
//       ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  C4().x.checkDynamic;
//       ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  C5(5).x.checkDynamic;
//        ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  C5(5).y.checkDynamic;
//        ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  C6(6).x.checkDynamic;
//        ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  C6(6).y.checkDynamic;
//        ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  C7().x.checkDynamic;
//       ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  C8().x.checkDynamic;
//       ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
