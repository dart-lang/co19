// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// variablePattern ::= ( 'var' | 'final' | 'final'? type )? identifier
///
/// A variable pattern binds the matched value to a new variable. These usually
/// occur as subpatterns of a destructuring pattern in order to capture a
/// destructured value.
/// ```dart
/// var (a, b) = (1, 2);
/// ```
/// Here, a and b are variable patterns and end up bound to 1 and 2,
/// respectively.
///
/// The pattern may have a type annotation in order to only match values of the
/// specified type. If the type annotation is omitted, the variable's type is
/// inferred and the pattern matches all values.
/// ```dart
/// switch (record) {
///   case (int x, String s):
///     print('First field is int $x and second is String $s.');
/// }
/// ```
/// @description Check that if type, `var` and `final` are all omitted then it
/// is a compile-time error
/// @author sgrekhov22@gmail.com

import "patterns_lib.dart";

String testRecord1(Record r) {
  switch (r) {
    case (a, b):
//        ^
// [analyzer] unspecified
// [cfe] unspecified
      return "($a, $b)";
//              ^
// [analyzer] unspecified
// [cfe] unspecified
    default:
      return "default";
  }
}

String testRecord2(Record r) {
  return switch (r) {
    (a, b) => "($a, $b)",
//   ^
// [analyzer] unspecified
// [cfe] unspecified
    _ => "default"
  };
}

String testRecord3(Record r) {
  if (r case (a, b)) {
//            ^
// [analyzer] unspecified
// [cfe] unspecified
    return "($a, $b)";
//            ^
// [analyzer] unspecified
// [cfe] unspecified
  } else {
    return "default";
  }
}

String testList1(List l) {
  switch (l) {
    case [a, b]:
//        ^
// [analyzer] unspecified
// [cfe] unspecified
    return "[$a, $b]";
//            ^
// [analyzer] unspecified
// [cfe] unspecified
    default:
      return "default";
  }
}

String testList2(List l) {
  return switch (l) {
     [a, b] => "[$a, $b]",
//    ^
// [analyzer] unspecified
// [cfe] unspecified
    _ => "default"
  };
}

String testList3(List l) {
  if (l case [a, b]) {
//            ^
// [analyzer] unspecified
// [cfe] unspecified
    return "[$a, $b]";
//            ^
// [analyzer] unspecified
// [cfe] unspecified
  } else {
    return "default";
  }
}

String testMap1(Map m) {
  switch (m) {
    case {1: a}:
//           ^
// [analyzer] unspecified
// [cfe] unspecified
      return "{1: $a}";
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
    default:
      return "default";
  }
}

String testMap2(Map m) {
  return switch (m) {
    {1: a} => "{1: $a}",
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    _ => "default"
  };
}

String testMap3(Map m) {
  if (m case {1: a}) {
//               ^
// [analyzer] unspecified
// [cfe] unspecified
    return "{1: $a}";
//               ^
// [analyzer] unspecified
// [cfe] unspecified
  } else {
    return "default";
  }
}

String testObject1(Shape shape) {
  switch (shape) {
    case Square(area: a):
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
      return "a=$a";
//               ^
// [analyzer] unspecified
// [cfe] unspecified
    default:
      return "default";
  }
}

String testObject2(Shape shape) {
  return switch (shape) {
    Square(area: a) => "a=$a",
//               ^
// [analyzer] unspecified
// [cfe] unspecified
    _ => "default"
  };
}

String testObject3(Shape shape) {
  if (shape case Square(area: a)) {
//                            ^
// [analyzer] unspecified
// [cfe] unspecified
    return "a=$a";
//             ^
// [analyzer] unspecified
// [cfe] unspecified
  } else {
    return "default";
  }
}

main() {
  testRecord1((1, "x"));
  testRecord2((1, "x"));
  testRecord3((1, "x"));

  testList1([1, "x"]);
  testList2([1, "x"]);
  testList3([1, "x"]);

  testMap1({1: 2});
  testMap2({1: 2});
  testMap3({1: 2});

  testObject1(Square(1));
  testObject2(Square(1));
  testObject3(Square(1));
}
