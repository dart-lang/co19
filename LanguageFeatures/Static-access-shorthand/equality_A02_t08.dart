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
/// Test an extension type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

extension type const ET<T>(T value) {
  const ET.id(this.value);
  const factory ET.f(T value) = ET<T>.new;

  static const ET<int> one = ET(1);
}

main() {
  if ([ET(0)] case == const [.new(0)]) {}
//                           ^
// [analyzer] unspecified
// [cfe] unspecified

  if ({ET(0)} case != const {.id(1)}) {}
//                           ^
// [analyzer] unspecified
// [cfe] unspecified

  if ({"key": ET(0)} case != const {"key": .f(2)}) {}
//                                         ^
// [analyzer] unspecified
// [cfe] unspecified

  if (ET(0) case == (.one)) {}
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
}
