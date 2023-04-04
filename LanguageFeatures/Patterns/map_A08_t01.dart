// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// mapPattern        ::= typeArguments? '{' mapPatternEntries? '}'
/// mapPatternEntries ::= mapPatternEntry ( ',' mapPatternEntry )* ','?
/// mapPatternEntry   ::= expression ':' pattern
///
/// A map pattern matches values that implement Map and accesses values by key
/// from it.
/// It is a compile-time error if:
/// - typeArguments is present and there are more or fewer than two type
///   arguments.
/// - Any of the entry key expressions are not constant expressions.
/// - Any two keys in the map are identical.
/// - Any two record keys which both have primitive equality are equal.
///
/// @description Check that an empty map pattern is a compile-time error
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

String test1(Map map) {
  return switch (map) {
    {} => "case-1",
//   ^
// [analyzer] unspecified
// [cfe] unspecified
    <String, int>{} => "case-2",
//                ^
// [analyzer] unspecified
// [cfe] unspecified
    _ => "default"
//    ^^
// [analyzer] HINT.UNREACHABLE_SWITCH_CASE
  };
}

String test2(Map map) {
  switch (map) {
    case {}:
//        ^
// [analyzer] unspecified
// [cfe] unspecified

      return "case-1";
    case <String, int>{}:
//                     ^
// [analyzer] unspecified
// [cfe] unspecified

      return "case-2";
    default:
      return "default";
  }
}

String test3(Map map) {
  if (map case {}) {
//              ^
// [analyzer] unspecified
// [cfe] unspecified
    return "case-1";
  }
  if (map case <String, int>{}) {
//                           ^
// [analyzer] unspecified
// [cfe] unspecified
    return "case-2";
  }
  return "default";
}

main() {
  var {} = {};
//     ^
// [analyzer] unspecified
// [cfe] unspecified
  final {} = {};
//       ^
// [analyzer] unspecified
// [cfe] unspecified

  test1({});
  test2({});
  test3({});
}
