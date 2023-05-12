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
/// @description Check that it is a compile-time error if typeArguments is
/// present and has more than one type argument
/// @author sgrekhov22@gmail.com

String test1(List list) {
  return switch (list) {
    <int, String>[1, > 0 || 42] => "",
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    _ => "default"
  };
}

String test2(List list) {
  switch (list) {
    case <int, String>[1, > 0 || 42]:
//             ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      return "";
    default:
      return "default";
  }
}

void test3(List list) {
  if (list case <int, String>[1, > 0 || 42]) {
//                    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  var <int, String>[a, b] = [1, "2"];
//          ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  test1([]);
  test2([]);
  test3([]);
}
