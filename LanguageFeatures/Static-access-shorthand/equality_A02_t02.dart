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
/// mixin.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

class C<T> {
  final T value;
  const C(this.value);

  @override
  bool operator ==(Object other) {
    if (other is C) {
      return value == other.value;
    }
    return false;
  }
}

mixin M<T> on C<T> {
  static M<int> get intOne => MC(1);
  static M<int> intTwo() => MC(2);
  static List<M<int>> values = [MC(3)];
}

class MC<T> = C<T> with M<T>;

M<int> foo(M<int> m) => m;

main() {
  bool condition = 2 > 1;
  M<int> m = MC<int>(0);

  if (m == condition ? .intOne : M.intTwo()) {}
//                     ^
// [analyzer] unspecified
// [cfe] unspecified

  if ([m] == [.intOne]) {}
//            ^
// [analyzer] unspecified
// [cfe] unspecified

  if ({m} != {.intTwo()}) {}
//            ^
// [analyzer] unspecified
// [cfe] unspecified

  if ({"key": m} != {"key": .values[0]}) {}
//                          ^
// [analyzer] unspecified
// [cfe] unspecified

  if (m != (.intTwo())) {}
//          ^
// [analyzer] unspecified
// [cfe] unspecified

  if (m != foo(.values[0])) {} // Ok, foo provides the context type
}
