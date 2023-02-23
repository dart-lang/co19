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
///
/// Else the operator is == or !=. It is a compile-time error if C is not
/// assignable to T? where T is M's == method parameter type.
/// The language screens out null before calling the underlying == method, which
/// is why T? is the allowed type. Since Object declares == to accept Object on
/// the right, this compile-time error can only happen if a user-defined class
/// has an override of == with a covariant parameter.
///
/// @description Check that it is a compile-time error if the operator is a
/// comparison (<, <=, >, or >=) and `M` does not define that operator. Test
/// nullable type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

class A {
  final num v;
  A(this.v);

  bool operator >(num other) {
    return this.v > other;
  }
  bool operator >=(num other) {
    return this.v >= other;
  }
  bool operator <(num other) {
    return this.v < other;
  }
  bool operator <=(num other) {
    return this.v <= other;
  }
}

String test1(A? a) {
  switch(a) {
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

String test2(A? a) {
  return switch(a) {
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
    _ => "default"
  };
}

String test3(A? a) {
  if (a case < 0) return "<";
//           ^^^
// [analyzer] unspecified
// [cfe] unspecified
  if (a case <= 0) return "<=";
//           ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  if (a case > 0) return ">";
//           ^^^
// [analyzer] unspecified
// [cfe] unspecified
  if (a case >= 0) return ">=";
//           ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  return "default";
}

main() {
  test1(A(0));
  test2(A(0));
  test3(A(0));
}
