// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For ==, we special-case when the right operand is (precisely!) a
/// static member shorthand.
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
/// `==` operator is not a precisely static member shorthand but a ternary
/// operator. Test an enum.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

extension type ET<T>(T value) {
  ET.id(this.value);
  factory ET.f(T t) = ET;

  static ET<int> get staticGetter => ET(1);
  static ET<X> staticMethod<X>(X x) => ET<X>(x);
  static List<ET<String>> instances = [ET("one")];
}


main() {
  bool condition = 2 > 1;
  ET<int> one = ET<int>(1);

  if (one == condition ? .new(1) : ET.id(2)) {}
//                       ^
// [analyzer] unspecified
// [cfe] unspecified

  if (one == condition ? ET(1) : .id(2)) {}
//                               ^
// [analyzer] unspecified
// [cfe] unspecified

  if (one != condition ? .f(0) : ET.f(1)) {}
//                       ^
// [analyzer] unspecified
// [cfe] unspecified

  if (one != condition ? ET(0) : .staticGetter) {}
//                               ^
// [analyzer] unspecified
// [cfe] unspecified

  if (one != condition ? .staticMethod<int>(1) : ET.staticGetter) {}
//                       ^
// [analyzer] unspecified
// [cfe] unspecified

  if (one != condition ? ET.staticMethod<int>(1) : .instances[0]) {}
//                                                 ^
// [analyzer] unspecified
// [cfe] unspecified
}
