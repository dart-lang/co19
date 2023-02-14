// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// To type check a pattern p being matched against a value of type M:
/// ...
/// Relational:
///
/// Let C be the static type of the right operand constant expression.
///
/// If the operator is a comparison (<, <=, >, or >=), then it is a compile-time
/// error if:
///
/// - M does not define that operator,
/// - C is not assignable to the operator's parameter type,
/// - or if the operator's return type is not assignable to bool.
/// Else the operator is == or !=. It is a compile-time error if C is not
/// assignable to T? where T is M's == method parameter type.
///
/// The language screens out null before calling the underlying == method, which
/// is why T? is the allowed type. Since Object declares == to accept Object on
/// the right, this compile-time error can only happen if a user-defined class
/// has an override of == with a covariant parameter.
///
/// @description Check that it is a compile-time error if the operator is a
/// comparison (<, <=, >, or >=), M does define that operator but it's return
/// type is not bool
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

class M {
  final int v;
  const M(this.v);

  int operator <(int other) => this.v - other;
  int operator <=(int other) => this.v - other;
  int operator >(int other) => this.v - other;
  int operator >=(int other) => this.v - other;
}

const zero = M(0);
const one = M(1);
const two = M(2);
const three = M(3);

String test1() {
  switch (zero) {
    case < 0:
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified
      return "<";
    case <= 1:
//       ^^^^
// [analyzer] unspecified
// [cfe] unspecified
      return "<=";
    case > 3:
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified
      return ">";
    case >= 2:
//       ^^^^
// [analyzer] unspecified
// [cfe] unspecified
      return ">=";
    default:
      return "default";
  }
}

String test2() {
  return switch (one) {
    < 1 => "<",
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified
    <= 1 => "<=",
//  ^^^^
// [analyzer] unspecified
// [cfe] unspecified
    > 3 => ">",
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified
    >= 2 => ">=",
//  ^^^^
// [analyzer] unspecified
// [cfe] unspecified
    _ => "default"
  };
}

String test3() {
  if (two case < 0) return "<";
//             ^^^
// [analyzer] unspecified
// [cfe] unspecified
  if (one case <= 1) return "<=";
//             ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  if (three case > 0) return ">";
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified
  if (two case >= 2) return ">=";
//             ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  return "default";
}

main() {
  test1();
  test2();
  test3();
}
