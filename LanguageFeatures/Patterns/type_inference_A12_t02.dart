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
/// The language screens out null before calling the underlying == method, which
/// is why T? is the allowed type. Since Object declares == to accept Object on
/// the right, this compile-time error can only happen if a user-defined class
/// has an override of == with a covariant parameter.
///
/// @description Check that it is a compile-time error if the operator is a
/// comparison (<, <=, >, or >=), M does not define that operator but C is not
/// assignable to the operator's parameter type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

class C {
  final int v;
  const C(this.v);

  bool operator <(C other) => this.v < other.v;
  bool operator <=(C other) => this.v <= other.v;
  bool operator >(C other) => this.v > other.v;
  bool operator >=(C other) => this.v >= other.v;
}

const zero = C(0);
const one = C(1);
const two = C(2);
const three = C(3);

String test1() {
  switch (42) {
    case < zero:
//       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      return "<";
    case <= one:
//       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      return "<=";
    case > three:
//       ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      return ">";
    case >= two:
//       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      return ">=";
    default:
      return "default";
  }
}

String test2() {
  return switch (42) {
    < zero => "<",
//  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    <= one => "<=",
//  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    > three => ">",
//  ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    >= two => ">=",
//  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    _ => "default";
  };
}

String test3() {
  if (42 case < zero) return "<";
//            ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  if (42 case <= one) return "<=";
//            ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  if (42 case > three) return ">";
//            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  if (42 case >= two) return ">=";
//            ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  return "default";
}

main() {
  test1();
  test2();
  test3();
}
