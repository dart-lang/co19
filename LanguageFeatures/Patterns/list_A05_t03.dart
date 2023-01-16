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
/// @description Check that relational subpattern can be used in a list's rest
/// pattern
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

String test1(List<int> list) {
  return switch (list) {
    <int>[1, 2, 3, 4, ... == const [5, 6]] => "case-1",
    [2, ...!= const [], 5, 6] => "case-2",
    <int>[... /* comment */ == const [3, 4, 5], 6, 7, 8] => "case-3",
    _ => "default"
  };
}

String test2(List<int> list) {
  switch (list) {
    case <int>[1, 2, 3, 4, ... == const [5, 6]]:
      return "case-1";
    case [2, ...!= const [], 5, 6]:
      return "case-2";
    case <int>[... /* comment */ == const [3, 4, 5], 6, 7, 8]:
      return "case-3";
    default:
      return "default";
  }
}

String test3(List<int> list) {
  if (list case <int>[1, 2, 3, 4, ... == const [5, 6]]) {
    return "case-1";
  }
  if (list case [2, ...!= const [], 5, 6]) {
    return "case-2";
  }
  if (list case <int>[... /* comment */ == const [3, 4, 5], 6, 7, 8]) {
    return "case-3";
  }
  return "default";
}

main() {
  Expect.equals("default", test1([1, 2, 3, 4, 5, 6]));
  Expect.equals("case-2", test1([2, 3, 4, 5, 6]));
  Expect.equals("default", test1([3, 4, 5, 6, 7, 8]));
  Expect.equals("default", test1([1, 2]));
  Expect.equals("default", test2([1, 2, 3, 4, 5, 6]));
  Expect.equals("case-2", test2([2, 3, 4, 5, 6]));
  Expect.equals("default", test2([3, 4, 5, 6, 7, 8]));
  Expect.equals("default", test2([1, 2]));
  Expect.equals("default", test3([1, 2, 3, 4, 5, 6]));
  Expect.equals("case-2", test3([2, 3, 4, 5, 6]));
  Expect.equals("default", test3([3, 4, 5, 6, 7, 8]));
  Expect.equals("default", test3([1, 2]));
}
