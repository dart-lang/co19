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
/// @description Check that logical-and subpattern can be used in a list's rest
/// pattern
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

String test1(List list) {
  return switch (list) {
    case <int>[1, 2, 3, 4, ... var r11 && var r12] => r11.toString() + r12.toString();
    case [2, ...final r21 && final r22, 5, 6] => r21.toString() + r22.toString();
    case <int>[... /* comment */ List<int> r31 && List<int> r32, 6, 7, 8] =>
      r31.toString() + r32.toString();
    default => "default";
  };
}

String test2(List list) {
  switch (list) {
    case <int>[1, 2, 3, 4, ... var r11 && var r12]:
      return r11.toString() + r12.toString();
    case [2, ...final r21 && final r22, 5, 6]:
      return r21.toString() + r22.toString();
    case <int>[... /* comment */ List r31 && List r32, 6, 7, 8]:
      return r31.toString() + r32.toString();
    default:
      return "default";
  }
}

String test3(List list) {
  if (list case <int>[1, 2, 3, 4, ... var r11 && var r12]) {
    return r11.toString() + r12.toString();
  }
  if (list case [2, ...final r21 && final r22, 5, 6]) {
    return r21.toString() + r22.toString();
  }
  if (list case <int>[... /* comment */ List r31 && List r32, 6, 7, 8]) {
    return r31.toString() + r32.toString();
  }
  return "default";
}

main() {
  var <int>[a1, b1, ... List r11 && List r12] = [1, 2, 3, 4, 5];
  Expect.equals(1, a1);
  Expect.equals(2, b1);
  Expect.listEquals([3, 4, 5], r11);
  Expect.listEquals([3, 4, 5], r12);

  final [a2, ...List<int> r21 && List<int> r22, b2, c2] = [2, 3, 4, 5, 6];
  Expect.equals(2, a2);
  Expect.listEquals([3, 4], r21);
  Expect.listEquals([3, 4], r22);
  Expect.equals(5, b2);
  Expect.equals(6, c2);

  var <int>[... /* comment */ r31 && r32, a3, b3, c3] = [1, 2, 3, 4, 5, 6];
  Expect.listEquals([1, 2, 3], r31);
  Expect.listEquals([1, 2, 3], r32);
  Expect.equals(4, a3);
  Expect.equals(5, b3);
  Expect.equals(6, c3);

  Expect.equals("${[5, 6]}${[5, 6]}", test1([1, 2, 3, 4, 5, 6]));
  Expect.equals("${[3, 4]}${[3, 4]}", test1([2, 3, 4, 5, 6]));
  Expect.equals("${[3, 4, 5]}${[3, 4, 5]}", test1([3, 4, 5, 6, 7, 8]));
  Expect.equals("default", test1([1, 2]));
  Expect.equals("${[5, 6]}${[5, 6]}", test2([1, 2, 3, 4, 5, 6]));
  Expect.equals("${[3, 4]}${[3, 4]}", test2([2, 3, 4, 5, 6]));
  Expect.equals("${[3, 4, 5]}${[3, 4, 5]}", test2([3, 4, 5, 6, 7, 8]));
  Expect.equals("default", test2([1, 2]));
  Expect.equals("${[5, 6]}${[5, 6]}", test3([1, 2, 3, 4, 5, 6]));
  Expect.equals("${[3, 4]}${[3, 4]}", test3([2, 3, 4, 5, 6]));
  Expect.equals("${[3, 4, 5]}${[3, 4, 5]}", test3([3, 4, 5, 6, 7, 8]));
  Expect.equals("default", test3([1, 2]));
}
