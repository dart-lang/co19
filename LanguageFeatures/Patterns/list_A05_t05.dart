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
/// @description Check that it is a static warning if null-check subpattern is
/// used in a list's rest pattern
/// @author sgrekhov22@gmail.com

String test1(List list) {
  return switch (list) {
    <int>[1, 2, 3, 4, ... var r1?] => r1.toString(),
//                              ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NULL_CHECK_PATTERN
    [2, ...final r2?, 5, 6] => r2.toString(),
//                 ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NULL_CHECK_PATTERN
    <int>[.../* comment */ List r3?, 6, 7, 8] => r3.toString(),
//                                ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NULL_CHECK_PATTERN
    _ => "default"
  };
}

String test2(List list) {
  switch (list) {
    case <int>[1, 2, 3, 4, ... var r1?]:
//                                   ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NULL_CHECK_PATTERN
      return r1.toString();
    case [2, ...final r2?, 5, 6]:
//                      ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NULL_CHECK_PATTERN
      return r2.toString();
    case <int>[... /* comment */ List r3?, 6, 7, 8]:
//                                      ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NULL_CHECK_PATTERN
      return r3.toString();
    default:
      return "default";
  }
}

String test3(List list) {
  if (list case <int>[1, 2, 3, 4, ... var r1?]) {
//                                          ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NULL_CHECK_PATTERN
    return r1.toString();
  }
  if (list case [2, ...final r2?, 5, 6]) {
//                             ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NULL_CHECK_PATTERN
    return r2.toString();
  }
  if (list case <int>[... /* comment */ List r3?, 6, 7, 8]) {
//                                             ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NULL_CHECK_PATTERN
    return r3.toString();
  }
  return "default";
}

main() {
  test1([1, 2, 3, 4, 5, 6]);
  test2([1, 2, 3, 4, 5, 6]);
  test3([1, 2, 3, 4, 5, 6]);
}
