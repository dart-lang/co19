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
/// comparison (<, <=, >, or >=) and M does not define that operator
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

String test1() {
  String s = "";
  switch(s) {
    case < 0:
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified
      return "<";
    case <= 0:
//       ^^^^
// [analyzer] unspecified
// [cfe] unspecified
      return "<=";
    case > 0:
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified

      return ">";
    case >= 0:
//       ^^^^
// [analyzer] unspecified
// [cfe] unspecified

      return ">=";
    default:
      return "default";
  }
}

String test2() {
  String s = "";
  return switch(s) {
    < 0 => "<",
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified
    <= 0 => "<=",
//  ^^^^
// [analyzer] unspecified
// [cfe] unspecified
    > 0 => ">",
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified
    >= 0 => ">=",
//  ^^^^
// [analyzer] unspecified
// [cfe] unspecified
    _ => "default";
  };
}

String test3() {
  String s = "";
  if (s case < 0) return "<";
//           ^^^
// [analyzer] unspecified
// [cfe] unspecified
  if (s case <= 0) return "<=";
//           ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  if (s case > 0) return ">";
//           ^^^
// [analyzer] unspecified
// [cfe] unspecified
  if (s case >= 0) return ">=";
//           ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  return "default";
}

main() {
  test1();
  test2();
  test3();
}
