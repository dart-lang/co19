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
/// @description Check that it is a compile-time error if rest element presents
/// in a map pattern.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

String test1(Map map) {
  return switch (map) {
    <int, int>{1: 1, ...} => "",
//                   ^^^
// [analyzer] unspecified
// [cfe] unspecified
    _ => "default"
  };
}

void test2(Map map) {
  switch (map) {
    case {3: 4, ..., 5: 6}:
//              ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

void test3(Map map) {
  if (map case {..., 1: _, 2: _}) {
//              ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  var {1: a, 2: b, ...} = {1: 1, 2: 2, 3: 3, 4: 4};
//                 ^^^
// [analyzer] unspecified
// [cfe] unspecified

  final {...} = {1: 1, 2: 2, 3: 3, 4: 4};
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified

  test1({});
  test2({});
  test3({});
}
