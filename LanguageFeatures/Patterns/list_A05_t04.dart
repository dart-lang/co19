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
/// @description Check that a cast subpattern can be used in a list's rest
/// pattern
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

String test1(List<int> list) {
  return switch (list) {
    <int>[1, 2, 3, 4, ... var r1 as List<num>] => r1.toString(),
    [2, ...final r2 as List, 5, 6] => r2.toString(),
    <int>[.../* comment */ List r3 as List<num>, 6, 7, 8] => r3.toString(),
    _ => "default"
  };
}

String test2(List<int> list) {
  switch (list) {
    case <int>[1, 2, 3, 4, ... var r1 as List<num>]:
      return r1.toString();
    case [2, ...final r2 as List, 5, 6]:
      return r2.toString();
    case <int>[... /* comment */ List r3 as List<num>, 6, 7, 8]:
      return r3.toString();
    default:
      return "default";
  }
}

String test3(List<int> list) {
  if (list case <int>[1, 2, 3, 4, ... var r1 as List<num>]) {
    return r1.toString();
  }
  if (list case [2, ...final r2 as List, 5, 6]) {
    return r2.toString();
  }
  if (list case <int>[... /* comment */ List r3 as List<num>, 6, 7, 8]) {
    return r3.toString();
  }
  return "default";
}

main() {
  var <int>[a1, b1, ... List r1 as List<num>] = [1, 2, 3, 4, 5];
  Expect.equals(1, a1);
  Expect.equals(2, b1);
  Expect.listEquals([3, 4, 5], r1);

  final [a2, ...List<int> r2 as List<int>, b2, c2] = [ 2, 3, 4, 5, 6];
  Expect.equals(2, a2);
  Expect.listEquals([3, 4], r2);
  Expect.equals(5, b2);
  Expect.equals(6, c2);

  var <int>[... /* comment */ r3 as List<num>, a3, b3, c3] = [1, 2, 3, 4, 5, 6];
  Expect.listEquals([1, 2, 3], r3);
  Expect.equals(4, a3);
  Expect.equals(5, b3);
  Expect.equals(6, c3);

  Expect.equals([5, 6].toString(), test1([1, 2, 3, 4, 5, 6]));
  Expect.equals([3, 4].toString(), test1([2, 3, 4, 5, 6]));
  Expect.equals([3, 4, 5].toString(), test1([3, 4, 5, 6, 7, 8]));
  Expect.equals("default", test1([1, 2]));
  Expect.equals([5, 6].toString(), test2([1, 2, 3, 4, 5, 6]));
  Expect.equals([3, 4].toString(), test2([2, 3, 4, 5, 6]));
  Expect.equals([3, 4, 5].toString(), test2([3, 4, 5, 6, 7, 8]));
  Expect.equals("default", test2([1, 2]));
  Expect.equals([5, 6].toString(), test3([1, 2, 3, 4, 5, 6]));
  Expect.equals([3, 4].toString(), test3([2, 3, 4, 5, 6]));
  Expect.equals([3, 4, 5].toString(), test3([3, 4, 5, 6, 7, 8]));
  Expect.equals("default", test3([1, 2]));
}
