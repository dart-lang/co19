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
/// @description Check that it is a compile-time error if any two record keys
/// are equal
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

String test1(Map map) {
  return switch (map) {
    {(): 1, (): 2} => "",
//          ^^
// [analyzer] unspecified
// [cfe] unspecified
    {(1,): 1, (1,): 2} => "",
//            ^^^^
// [analyzer] unspecified
// [cfe] unspecified
    {(n: 2): var a1, (n: 2): final b1} => "",
//                   ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    {(1, n: 2): var a2, (n:2, 1): final b2} => "",
//                      ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    _ => "default"
  };
}

void test2(Map map) {
  switch (map) {
    case {(): 1, (): 2}:
//               ^^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case {(1,): 1, (1,): 2}:
//                 ^^^^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case {(n: 1): var a1, (n: 1): final b1}:
//                        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case {(1, n: 2): var a2, (n:2, 1): final b2}:
//                           ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      break;
  }
}

void test3(Map map) {
  if (map case {(): 1, (): 2}) {
//                     ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (map case {(1,): 1, (1,): 2}) {
//                       ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (map case {(n: 1): var a1, (n: 1): final b1}) {
//                              ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (map case {(1, n: 2): var a2, (n:2, 1): final b2}) {
//                                 ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  var {(): 1, (): 2} = {(): 1};
//            ^^
// [analyzer] unspecified
// [cfe] unspecified
  var {(1,): 1, (1,): 2} = {(1,): 2};
//              ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final {(n: 1): var a1, (n: 1): final b1} = {(n: 1): 2};
//                       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final {(1, n: 2): var a2, (n: 2, 1): final b2} = {(1, n: 2): 1};
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  test1({});
  test2({});
  test3({});
}
