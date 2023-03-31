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
/// @description Check that it is a compile-time error if typeArguments is
/// present and there are more or fewer than two type arguments
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

String test1(Map map) {
  return switch (map) {
    <int, int, String>{1: > 0 || 42} => "",
//             ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    <int>{1: > 0 || 42} => "",
//   ^^^
// [analyzer] unspecified
// [cfe] unspecified
    _ => "default"
  };
}

String test2(Map map) {
  switch (map) {
    case <int, int, String>{1: > 0 || 42}:
//                  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return "1";
  case <int>{1: > 0 || 42}:
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
      return "2";
    default:
      return "default";
  }
}

void test3(Map map) {
  if (map case <int, int, String>{1: > 0 || 42}) {
//                        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (map case <int>{1: > 0 || 42}) {
//              ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  var <int, String, Object>{1: a1, 2: b1} = {1: "1", 2: "2"};
//                  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var <int>{1: a2, 2: b2} = {1: "1", 2: "2"};
//     ^^^
// [analyzer] unspecified
// [cfe] unspecified

  test1({});
  test2({});
  test3({});
}
