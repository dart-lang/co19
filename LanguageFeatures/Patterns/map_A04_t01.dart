// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// mapPattern        ::= typeArguments? '{' mapPatternEntries? '}'
/// mapPatternEntries ::= mapPatternEntry ( ',' mapPatternEntry )* ','?
/// mapPatternEntry   ::= expression ':' pattern | '...'
///
/// A map pattern matches values that implement Map and accesses values by key
/// from it.
///
/// It is a compile-time error if:
///
/// typeArguments is present and there are more or fewer than two type arguments
///
/// Any of the entry key expressions are not constant expressions.
///
/// If any two keys in the map both have primitive == methods, then it is a
/// compile-time error if they are equal according to their == operator. In
/// cases where keys have types whose equality can be checked at compile time,
/// we report errors if there are redundant keys. But we don't require the keys
/// to have primitive equality for flexibility. In map patterns where the keys
/// don't have primitive equality, it is possible to have redundant keys and the
/// compiler won't detect it.
///
/// There is more than one ... element in the map pattern.
///
/// The ... element is not the last element in the map pattern.
///
/// @description Check that it is a compile-time error if any two keys in the
/// map both have primitive == methods and they are equal according to their ==
/// operator
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

class C {
  const C();
}

const c1 = C();
const c2 = C();

String test1(Map map) {
  return switch (map) {
    case {const C(): 1, const C(): 2} => "";
//                      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case {1: 1, 1: 2} => "";
//              ^
// [analyzer] unspecified
// [cfe] unspecified
    case {c1: var a, c2: final b} => "";
//                   ^^
// [analyzer] unspecified
// [cfe] unspecified
    default => "default";
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
    case {c1: var a, c2: final b}:
//                   ^^
// [analyzer] unspecified
// [cfe] unspecified
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
  if (map case {c1: var a, c2: final b}) {
//                         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  var {const C(): 1, const C(): 2} = {const C(): 1, const C(): 2};
//                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var {1: 1, 1: 2} = {1: 1, 1: 2};
//           ^
// [analyzer] unspecified
// [cfe] unspecified
  final {c1: var a, c2: final b} = {c1: 1, c2: 2};
//                  ^^
// [analyzer] unspecified
// [cfe] unspecified

  test1({});
  test2({});
  test3({});
}
