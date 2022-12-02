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
/// @description Check that it is a compile-time error if one typeArgument is
/// present and map pattern is empty (to ensure that we have no set pattern)
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

String test1(Object object) {
  return switch (object) {
    case <int>{} => "";
//       ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    default => "default";
  };
}

String test2(Object object) {
  switch (object) {
    case <int>{}:
//       ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      return "1";
    default:
      return "default";
  }
}

void test3(Object object) {
  if (object case <int>{}) {
//                ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  test1({});
  test2({});
  test3({});
}
