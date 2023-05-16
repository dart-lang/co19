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
/// @description Check that it is a compile-time error if any of the entry key
/// expressions are not constant expressions.
/// @author sgrekhov22@gmail.com

class C {
  const C();
}

var key1 = 1;
final key2 = C();

String test1(Map map) {
  return switch (map) {
    {key1: > 0 || 42, 2: var a} => "",
//   ^^^^
// [analyzer] unspecified
// [cfe] unspecified
    {key2: C()} => "",
//   ^^^^
// [analyzer] unspecified
// [cfe] unspecified
    {var a: 2} => "",
//   ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    {final b: 2} => "",
//   ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    {final int c: 2} => "",
//        ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    {int d: 2} => "",
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    _ => "default"
  };
}

void test2(Map map) {
  switch (map) {
    case {key1: > 0 || 42, 2: var a}:
//        ^^^^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case {key2: C()}:
//        ^^^^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case {var a: 2}:
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case {final b: 2}:
//        ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case {final int c: 2}:
//        ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case {int d: 2}:
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      break;
  }
}

void test3(Map map) {
  if (map case {key1: > 0 || 42, 2: var a}) {
//              ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (map case {key2: C()}) {
//              ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (map case {var a: 2}) {
//              ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (map case {final b: 2}) {
//              ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (map case {final int c: 2}) {
//              ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (map case {int d: 2}) {
//              ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  var {key1: a1, 2: var b1} = {1: 1, 2: 2};
//     ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var {key2: C()} = {C(): C()};
//     ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final {int a: 2} = {1: 2};
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  test1({});
  test2({});
  test3({});
}
