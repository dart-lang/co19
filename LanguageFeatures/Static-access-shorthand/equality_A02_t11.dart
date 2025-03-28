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
/// type. Test an enum.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

enum E {
  e0, e1;
  const E();

  static E get staticGetter => E.e0;
  static E staticMethod() => E.e1;
}

main() {
  if (.e0 == E.e0) {}
//    ^
// [analyzer] unspecified
// [cfe] unspecified

  if (.staticGetter != E.e0) {}
//    ^
// [analyzer] unspecified
// [cfe] unspecified

  if (.staticMethod() == E.e1) {}
//    ^
// [analyzer] unspecified
// [cfe] unspecified

  if (.values[0] != E.e1) {}
//    ^
// [analyzer] unspecified
// [cfe] unspecified

  if ((E.e0 as Object) == .e0) {}
//                        ^
// [analyzer] unspecified
// [cfe] unspecified

  if ((E.e0 as Object) != .staticGetter) {}
//                        ^
// [analyzer] unspecified
// [cfe] unspecified
}
