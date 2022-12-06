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
/// If any two keys in the map are identical. Map patterns that don't have a
/// rest element only match if the length of the map is equal to the number of
/// map entries. If a map pattern has multiple identical key entries, they will
/// increase the required length for the pattern to match but in all but the
/// most perverse Map implementations will represent the same key. Thus, it's
/// very unlikely that any map pattern containing identical keys (and no rest
/// element) will ever match. Duplicate keys are most likely a typo in the code.
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
/// @description Check that it is a compile-time error if typeArguments is
/// present and there are more or fewer than two type arguments
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

String test1(Map map) {
  return switch (map) {
    case <int, int, String>{1: > 0 || 42} => "";
//                  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case <int>{1: > 0 || 42} => "";
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
    default => "default";
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
