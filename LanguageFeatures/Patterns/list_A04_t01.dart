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
/// new list and that list is matched against the rest subpattern. Test `var`
/// keyword
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

String test1(List list) {
  return switch (list) {
    case <int>[1, var b, 3, 4, ... var r] => r.toString();
    default => "default";
  };
}

String test2(List list) {
  switch (list) {
    case [1, ...final r, 5]:
      return r.toString();
    default:
      return "default";
  }
}

String test3(List list) {
  if (list case <int>[final List<int> ...r, 4, 5]) {
    return r.toString();
  }
  return "default";
}

main() {
  var [a1, b1, ...c1] = [1, 2, 3, 4, 5];
  Expect.equals(1, a1);
  Expect.equals(2, b1);
  Expect.listEquals([3, 4, 5], c1);

  var <int>[a2, ...b2, c2] = [1, 2, 3, 4, 5];
  Expect.equals(1, a2);
  Expect.equals(5, c2);
  Expect.listEquals([2, 3, 4], b2);

  var [...a3, b3, c3] = [1, 2, 3, 4, 5];
  Expect.equals(4, b3);
  Expect.equals(5, c3);
  Expect.listEquals([1, 2, 3], b2);

  Expect.equals([5, 6].toString(), test1([1, 2, 3, 4, 5, 6]));
  Expect.equals([2, 3, 4].toString(), test1([1, 2, 3, 4, 5]));
}
