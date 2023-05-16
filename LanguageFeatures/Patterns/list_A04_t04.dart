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
/// pattern with wildcards
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

String test1(List<int> list) {
  return switch (list) {
    <int>[1, 2, 3, 4, ... _] => "[1, 2, 3, 4, ... _]",
    [2, ..._, 5, 6] => "[2, ..._, 5, 6]",
    <int>[... /* comment */ _, 6, 7, 8] => "[... _, 6, 7, 8]",
    _ => "default"
  };
}

String test2(List<int> list) {
  switch (list) {
    case <int>[1, 2, 3, 4, ... _]:
      return "[1, 2, 3, 4, ... _]";
    case [2, ..._, 5, 6]:
      return "[2, ..._, 5, 6]";
    case <int>[... /* comment */ _, 6, 7, 8]:
      return "[... _, 6, 7, 8]";
    default:
      return "default";
  }
}

String test3(List<int> list) {
  if (list case <int>[1, 2, 3, 4, ... _]) {
    return "[1, 2, 3, 4, ... _]";
  }
  if (list case [2, ..._, 5, 6]) {
    return "[2, ..._, 5, 6]";
  }
  if (list case <int>[... /* comment */ _, 6, 7, 8]) {
    return "[... _, 6, 7, 8]";
  }
  return "default";
}

main() {
  var <int>[a1, b1, ... _] = [1, 2, 3, 4, 5];
  Expect.equals(1, a1);
  Expect.equals(2, b1);

  final [a2, ..._, b2] = [2, 3, 4, 5];
  Expect.equals(2, a2);
  Expect.equals(5, b2);

  var [... /* comment */ _, a3, b3] = [1, 2, 3, 4, 5];
  Expect.equals(4, a3);
  Expect.equals(5, b3);

  Expect.equals("[1, 2, 3, 4, ... _]", test1([1, 2, 3, 4, 5, 6]));
  Expect.equals("[2, ..._, 5, 6]", test1([2, 3, 4, 5, 6]));
  Expect.equals("[... _, 6, 7, 8]", test1([3, 4, 5, 6, 7, 8]));
  Expect.equals("default", test1([1, 2]));
  Expect.equals("[1, 2, 3, 4, ... _]", test2([1, 2, 3, 4, 5, 6]));
  Expect.equals("[2, ..._, 5, 6]", test2([2, 3, 4, 5, 6]));
  Expect.equals("[... _, 6, 7, 8]", test2([3, 4, 5, 6, 7, 8]));
  Expect.equals("default", test2([1, 2]));
  Expect.equals("[1, 2, 3, 4, ... _]", test3([1, 2, 3, 4, 5, 6]));
  Expect.equals("[2, ..._, 5, 6]", test3([2, 3, 4, 5, 6]));
  Expect.equals("[... _, 6, 7, 8]", test3([3, 4, 5, 6, 7, 8]));
  Expect.equals("default", test3([1, 2]));
}
