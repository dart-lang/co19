// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// listPattern         ::= typeArguments? '[' listPatternElements? ']'
/// listPatternElements ::= listPatternElement ( ',' listPatternElement )* ','?
/// listPatternElement  ::= pattern | restPattern
/// restPattern         ::= '...' pattern?
///
/// A list pattern may contain a rest element which allows matching lists of
/// arbitrary lengths. If a rest element is present and has a subpattern, all of
/// the elements not matched by other subpatterns are collected into a new list
/// and that list is matched against the rest subpattern.
///
/// var [a, b, ...rest, c, d] = [1, 2, 3, 4, 5, 6, 7];
/// print('$a $b $rest $c $d'); // Prints "1 2 [3, 4, 5] 6 7".
///
/// @description Check that it is a compile-time error if rest pattern in a
/// matching context declares a variable but has no `final`, `var` or type
/// @author sgrekhov22@gmail.com

String test1(List list) {
  return switch (list) {
    <int>[1, 2, 3, 4, ... r1] => "[1, 2, 3, 4, ...]",
//                        ^^
// [analyzer] unspecified
// [cfe] unspecified
    [2, ...r2, 5, 6] => "[2, ..., 5, 6]",
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
    <int>[... /* comment */ r3, 6, 7, 8] => "[..., 6, 7, 8]",
//                          ^^
// [analyzer] unspecified
// [cfe] unspecified
    _ => "default"
  };
}

String test2(List list) {
  switch (list) {
    case <int>[1, 2, 3, 4, ... r1]:
//                             ^^
// [analyzer] unspecified
// [cfe] unspecified
      return "[1, 2, 3, 4, ...]";
    case [2, ...r2, 5, 6]:
//              ^^
// [analyzer] unspecified
// [cfe] unspecified
      return "[2, ..., 5, 6]";
    case <int>[... /* comment */ r3, 6, 7, 8]:
//                               ^^
// [analyzer] unspecified
// [cfe] unspecified
      return "[..., 6, 7, 8]";
    default:
      return "default";
  }
}

String test3(List list) {
  if (list case <int>[1, 2, 3, 4, ... r1]) {
//                                    ^^
// [analyzer] unspecified
// [cfe] unspecified
    return "[1, 2, 3, 4, ...]";
  }
  if (list case [2, ...r2, 5, 6]) {
//                     ^^
// [analyzer] unspecified
// [cfe] unspecified
    return "[2, ..., 5, 6]";
  }
  if (list case <int>[... /* comment */ r3, 6, 7, 8]) {
//                                      ^^
// [analyzer] unspecified
// [cfe] unspecified
    return "[..., 6, 7, 8]";
  }
  return "default";
}

main() {
  test1([]);
  test2([]);
  test3([]);
}
