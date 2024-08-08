// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// To type check a pattern p being matched against a value of type M:
/// ...
/// Object:
///
/// i. Resolve the object name to a type X. It is a compile-time error if the
///   name does not refer to a type. Apply downwards inference from M to infer
///   type arguments for X if needed.
/// ii. For each field subpattern of p, with name n and subpattern f:
///   a. Look up the member with name n on X using normal property extraction
///     rules. Let G be the type of the resulting property.
///
///     Property extraction allows an object pattern to invoke a getter or
///     tear-off a method. When X is dynamic or Never then X has all properties
///     and their types are likewise dynamic or Never unless the property is
///     defined on Object, in which case it has its usual type.
///
///   b. Type check f using G as the matched value type to find its required
///     type.
/// iii. The required type of p is X.
///
/// @description Check that it is a compile-time error if the name of the object
/// pattern does not refer to a type
/// @author sgrekhov22@gmail.com

String test1() {
  switch (Object()) {
    case Missing():
//       ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      return "match";
    default:
      return "no match";
  }
}

String test2() {
  if (Object() case Missing()) {
//                  ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      return "match-1";
  }
  return "no match";
}

String test3() =>
  switch (Object()) {
    Missing() => "match",
//  ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    _ => "default"
//    ^^
// [analyzer] WARNING.UNREACHABLE_SWITCH_CASE
  };

main() {
  var Missing() = Object() as dynamic;
//    ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  test1();
  test2();
  test3();
}
