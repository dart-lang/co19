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
/// @description Checks that it is a compile-time error if the right operand of
/// `==` or `!=` operators is not a precisely static member shorthand. Test an
/// enum.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

enum E<T> {
  e0(0), e1("1");
  final T value;
  const E(this.value);

  static E<int> get staticGetter => E.e0;
  static E staticMethod(int index) => E.values[index];
}

E<int> foo(E<int> e) => e;

main() {
  bool condition = 2 > 1;

  if (E.e0 == condition ? .e0 : E.e1) {}
//                        ^
// [analyzer] unspecified
// [cfe] unspecified

  if ([E.e0] == [.staticGetter]) {}
//               ^
// [analyzer] unspecified
// [cfe] unspecified

  if ({E.e0} != {.staticMethod(0)}) {}
//               ^
// [analyzer] unspecified
// [cfe] unspecified

  if ({"key": E.e0} != {"key": .values[0]}) {}
//                             ^
// [analyzer] unspecified
// [cfe] unspecified

  if (E.e0 == (.e0)) {}
//             ^
// [analyzer] unspecified
// [cfe] unspecified

  if (E.e0 == foo(.e0)) {}
//                ^
// [analyzer] unspecified
// [cfe] unspecified
}
