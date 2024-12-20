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
/// @description Checks that it is a compile-time error if a pattern has the
/// form `== e2` or `!= e2` and `e2` is not a precisely shorthand expression.
/// Test an enum.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

enum E<T> {
  e0(0);
  final T value;
  const E(this.value);

  static const E<int> instance = E.e0;
}

main() {
  if ([E.e0] == const [.e0]) {}
//                     ^
// [analyzer] unspecified
// [cfe] unspecified

  if ({E.e0} != const {.instance}) {}
//                     ^
// [analyzer] unspecified
// [cfe] unspecified

  if ({"key": E.e0} != const {"key": .e0}) {}
//                                   ^
// [analyzer] unspecified
// [cfe] unspecified

  if (E.e0 == (.instance)) {}
//             ^
// [analyzer] unspecified
// [cfe] unspecified
}
