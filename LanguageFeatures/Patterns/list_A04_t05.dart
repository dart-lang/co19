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
/// @description Check that if a rest element is present and has a subpattern,
/// all of the elements not matched by other subpatterns are collected into a
/// new list and that list is matched against the rest subpattern. Test rest
/// pattern without any pattern
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

String test1(List list) {
  return switch (list) {
    case <int>[1, 2, 3, 4, ...] => "[1, 2, 3, 4, ...]";
    case [2, ..., 5, 6] => "[2, ..., 5, 6]";
    case <int>[... /* comment */, 6, 7, 8] => "[..., 6, 7, 8]";
    default => "default";
  };
}

String test2(List list) {
  switch (list) {
    case <int>[1, 2, 3, 4, ...]:
      return "[1, 2, 3, 4, ...]";
    case [2, ..., 5, 6]:
      return "[2, ..., 5, 6]";
    case <int>[... /* comment */, 6, 7, 8]:
      return "[..., 6, 7, 8]";
    default:
      return "default";
  }
}

String test3(List list) {
  if (list case <int>[1, 2, 3, 4, ...]) {
    return "[1, 2, 3, 4, ...]";
  }
  if (list case [2, ..., 5, 6]) {
    return "[2, ..., 5, 6]";
  }
  if (list case <int>[... /* comment */, 6, 7, 8]) {
    return "[..., 6, 7, 8]";
  }
  return "default";
}

main() {
  var <int>[a1, b1, ...] = [1, 2, 3, 4, 5];
  Expect.equals(1, a1);
  Expect.equals(2, b1);

  final [a2, ..., b2] = [2, 3, 4, 5];
  Expect.equals(2, a2);
  Expect.equals(5, b2);

  var [... /* comment */, a3, b3] = [1, 2, 3, 4, 5];
  Expect.equals(4, a3);
  Expect.equals(5, b3)

  Expect.equals("[1, 2, 3, 4, ...]", test1([1, 2, 3, 4, 5, 6]));
  Expect.equals("[2, ..., 5, 6]", test1([2, 3, 4, 5, 6]));
  Expect.equals("[..., 6, 7, 8]", test1([3, 4, 5, 6, 7, 8]));
  Expect.equals("default", test1([1, 2]));
  Expect.equals("[1, 2, 3, 4, ...]", test2([1, 2, 3, 4, 5, 6]));
  Expect.equals("[2, ..., 5, 6]", test2([2, 3, 4, 5, 6]));
  Expect.equals("[..., 6, 7, 8]", test2([3, 4, 5, 6, 7, 8]));
  Expect.equals("default", test2([1, 2]));
  Expect.equals("[1, 2, 3, 4, ...]", test3([1, 2, 3, 4, 5, 6]));
  Expect.equals("[2, ..., 5, 6]", test3([2, 3, 4, 5, 6]));
  Expect.equals("[..., 6, 7, 8]", test3([3, 4, 5, 6, 7, 8]));
  Expect.equals("default", test3([1, 2]));
}
