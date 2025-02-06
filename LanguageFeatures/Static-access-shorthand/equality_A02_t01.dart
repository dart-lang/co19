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
/// `==` or `!=` operators is not a precisely static member shorthand. Test a
/// class.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

class C<T> {
  final T value;
  const C(this.value);
  const C.id(this.value);
  const factory C.f(T t) = C;

  static C<int> get intOne => C(1);
  static C<int> intTwo() => C(2);
  static List<C<int>> values = [C(3)];

  @override
  bool operator ==(Object other) {
    if (other is C) {
      return value == other.value;
    }
    return false;
  }
}

C<int> foo(C<int> c) => c;

main() {
  bool condition = 2 > 1;
  if (C(0) == condition ? .new(0) : C.id(1)) {}
//                        ^
// [analyzer] unspecified
// [cfe] unspecified

  if ([C(0)] == [.id(1)]) {}
//               ^
// [analyzer] unspecified
// [cfe] unspecified

  if ({C(0)} != {.f(0)}) {}
//               ^
// [analyzer] unspecified
// [cfe] unspecified

  if ({"key": C(0)} != {"key": .intOne}) {}
//                             ^
// [analyzer] unspecified
// [cfe] unspecified

  if (C(0) == (.intTwo())) {}
//             ^
// [analyzer] unspecified
// [cfe] unspecified

  if (C(0) == foo(.values[0])) {}
//                ^
// [analyzer] unspecified
// [cfe] unspecified
}
