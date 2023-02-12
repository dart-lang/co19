// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// To type check a pattern p being matched against a value of type M:
/// ...
/// Cast:
///
/// Resolve the type name to a type X. It is a compile-time error if the name
/// does not refer to a type.
///
/// Type-check the subpattern using X as the matched value type.
///
/// @description Check that it is a compile-time error if X does not refer to a
/// type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

const INT = 42;

String test1() {
  num x = 0;
  switch (x) {
    case var y as INT:
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified
      return "int";
    case final z as "String":
//                  ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      return "String";
    default:
      return "default";
  }
}

String test2() {
  num x = 0;
  return switch (x) {
    var y as INT => "int",
//           ^^^
// [analyzer] unspecified
// [cfe] unspecified
    final z as "String" => "String",
//             ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    _ => "default";
  };
}

String test3() {
  num x = 0;
  if (x case var y as INT) return "int";
//                    ^^^
// [analyzer] unspecified
// [cfe] unspecified
  if (x case final z as "String") return "String";
//                      ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  return "default";
}

main() {
  test1();
  test2();
  test3();
}
