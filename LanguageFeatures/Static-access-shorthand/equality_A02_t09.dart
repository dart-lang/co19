// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For `==`, we special-case when the right operand is (precisely!)
/// a static member shorthand.
/// ...
/// This special-casing is only against an immediate static member shorthand. It
/// does not change the context type of the second operand, so it would not work
/// with, for example, `Endian.host == wantBig ? .big : .little`. Here the
/// second operand is not a `<staticMemberShorthand>`, so it won't have a
/// shorthand context set, and the context type of the second operand of `==` is
/// the empty context `_`. (It's neither the static type of the first operand,
/// nor the parameter type of the first operand's `operator==`.)
///
/// @description Checks that it is a compile-time error to use a shorthand
/// expression in a left side of a (not)equality operator or in a wrong context
/// type. Test a class.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

class C {
  C();
  C.id();
  factory C.f() => C();

  static C get staticGetter => C();
  static C staticMethod() => C();
  static final C instance = C();
}

main() {
  if (.new() == C()) {}
//    ^
// [analyzer] unspecified
// [cfe] unspecified

  if (.id() != C()) {}
//    ^
// [analyzer] unspecified
// [cfe] unspecified

  if (.f() == C()) {}
//    ^
// [analyzer] unspecified
// [cfe] unspecified

  if (.staticGetter != C()) {}
//    ^
// [analyzer] unspecified
// [cfe] unspecified

  if (.staticMethod() == C()) {}
//    ^
// [analyzer] unspecified
// [cfe] unspecified

  if (.instance != C()) {}
//    ^
// [analyzer] unspecified
// [cfe] unspecified

  if ((C() as Object) == .new()) {}
//                       ^
// [analyzer] unspecified
// [cfe] unspecified

  if ((C() as Object) != .instance) {}
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
}
