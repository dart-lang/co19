// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// listPattern         ::= typeArguments? '[' listPatternElements? ']'
/// listPatternElements ::= listPatternElement ( ',' listPatternElement )* ','?
/// listPatternElement  ::= pattern | restPattern
/// restPattern         ::= '...' pattern?
///
/// A list pattern matches an object that implements List and extracts elements
/// by position from it.
///
/// It is a compile-time error if:
///
/// typeArguments is present and has more than one type argument.
///
/// There is more than one restPattern element in the list pattern. It can
/// appear anywhere in the list, but there can only be zero or one.
///
/// @description Check that it is a compile-time error if there is more than one
/// restPattern element in the list pattern
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

String test1(List list) {
  return switch (list) {
    case <int>[1, ...var r1, 3, 4, ... var r2] => "";
//                                 ^^^
// [analyzer] unspecified
// [cfe] unspecified
    default => "default";
  };
}

String test2(List list) {
  switch (list) {
    case [...final r1, 3, 4, ...final r2]:
//                           ^^^
// [analyzer] unspecified
// [cfe] unspecified
      return "";
    default:
      return "default";
  }
}

String test3(List list) {
  if (list case [1, ...List r1, ...List r2]) {
//                              ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  var [a, b, ...c, ...] = [1, 2, 3, 4, 5];
//                 ^^^
// [analyzer] unspecified
// [cfe] unspecified

  var [a, b, ...c, ..._] = [1, 2, 3, 4, 5];
//                 ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  test1([]);
  test2([]);
  test3([]);
}
