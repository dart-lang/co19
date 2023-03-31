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
/// @description Check that it is a compile-time error if any two keys in the
/// map pattern are identical
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

class C {
  const C();
}

const c1 = C();
const c2 = C();

String test1(Map map) {
  return switch (map) {
    {const C(): 1, const C(): 2} => "",
//                 ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    {1: 1, 1: 2} => "",
//         ^
// [analyzer] unspecified
// [cfe] unspecified
    {c1: var a1, c2: final b1} => "",
//               ^^
// [analyzer] unspecified
// [cfe] unspecified
    {3.14: var a2, 3.14: final b2} => "",
//                 ^^^^
// [analyzer] unspecified
// [cfe] unspecified
    {"x": var a3, "x": final b3} => "",
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified
    _ => "default"
  };
}

void test2(Map map) {
  switch (map) {
    case {const C(): 1, const C(): 2}:
//                      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case {1: 1, 1: 2}:
//              ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case {c1: var a1, c2: final b1}:
//                    ^^
// [analyzer] unspecified
// [cfe] unspecified
    case {3.14: var a2, 3.14: final b2}:
//                      ^^^^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case {"x": var a3, "x": final b3}:
//                     ^^^
// [analyzer] unspecified
// [cfe] unspecified
      break;
  }
}

void test3(Map map) {
  if (map case {const C(): 1, const C(): 2}) {
//                            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (map case {1: 1, 1: 2}) {
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (map case {c1: var a1, c2: final b1}) {
//                          ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (map case {3.14: var a2, 3.14: final b2}) {
//                            ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (map case {"x": var a3, "x": final b3}) {
//                           ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  var {const C(): 1, const C(): 2} = {const C(): 1};
//                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var {1: 1, 1: 2} = {1: 2};
//           ^
// [analyzer] unspecified
// [cfe] unspecified
  final {c1: var a1, c2: final b1} = {c2: 2};
//                   ^^
// [analyzer] unspecified
// [cfe] unspecified
  final {3.14: var a2, 3.14: final b2} = {3.14: 1};
//                     ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final {"x": var a3, "x": final b3} = {"x": 1};
//                    ^^^
// [analyzer] unspecified
// [cfe] unspecified

  test1({});
  test2({});
  test3({});
}
