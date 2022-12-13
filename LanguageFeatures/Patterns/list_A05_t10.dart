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
/// @description Check that record subpattern can be used in a list's rest
/// pattern
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";

String test1(List list) {
  return switch (list) {
    [1, 2, 3, 4, ... (var r11,)] => r11.toString(),
    [1, 2, 3, 4, ... (n: var r12)] => r12.toString(),
    [1, 2, 3, 4, ... (n: var r13, 42)] => r13.toString(),
    [2, ...(final r21,), 5, 6] => r21.toString(),
    [2, ...(n: final r22), 5, 6] => r22.toString(),
    [2, ...(n: final r23, 42), 5, 6] => r23.toString(),
    [... /* comment */ (var r31,), 6, 7, 8] => r31.toString(),
    [... /* comment */ (n: var r32), 6, 7, 8] => r32.toString(),
    [... /* comment */ (n: var r33, 42), 6, 7, 8] => r33.toString(),
    _ => "default"
  };
}

String test2(List list) {
  switch (list) {
    case [1, 2, 3, 4, ... (var r11,)]:
      return r11.toString();
    case [1, 2, 3, 4, ... (n: var r12)]:
      return r12.toString();
    case [1, 2, 3, 4, ... (n: var r13, 42)]:
      return r13.toString();
    case [2, ...(final r21,), 5, 6]:
      return r21.toString();
    case [2, ...(n: final r22), 5, 6]:
      return r22.toString();
    case [2, ...(n: final r23, 42), 5, 6]:
      return r23.toString();
    case [... /* comment */ (var r31,), 6, 7, 8]:
      return r31.toString();
    case [... /* comment */ (n: var r32), 6, 7, 8]:
      return r32.toString();
    case [... /* comment */ (n: var r33, 42), 6, 7, 8]:
      return r33.toString();
    default:
      return "default";
  }
}

String test3(List list) {
  if (list case [1, 2, 3, 4, ... (var r11,)]) {
    return r11.toString();
  }
  if (list case [1, 2, 3, 4, ... (n: var r12)]) {
    return r12.toString();
  }
  if (list case [1, 2, 3, 4, ... (n: var r13, 42)]) {
    return r13.toString();
  }
  if (list case [2, ...(final r21,), 5, 6]) {
    return r21.toString();
  }
  if (list case [2, ...(n: final r22), 5, 6]) {
    return r22.toString();
  }
  if (list case [2, ...(n: final r23, 42), 5, 6]) {
    return r23.toString();
  }
  if (list case [... /* comment */ (var r31,), 6, 7, 8]) {
    return r31.toString();
  }
  if (list case [... /* comment */ (n: var r32), 6, 7, 8]) {
    return r32.toString();
  }
  if (list case [... /* comment */ (n: var r33, 42), 6, 7, 8]) {
      return r33.toString();
  }
  return "default";
}

main() {
  Expect.equals("default", test1([1, 2, 3, 4, (42,)]));
  Expect.equals("default", test1([1, 2, 3, 4, (n: -1)]));
  Expect.equals("default", test1([1, 2, 3, 4, (n: -1, 42)]));
  Expect.equals("default", test1([2, (42,), 5, 6]));
  Expect.equals("default", test1([2, (n: -1), 5, 6]));
  Expect.equals("default", test1([2, (n: -1, 42), 5, 6]));
  Expect.equals("default", test1([(42,), 6, 7, 8]));
  Expect.equals("default", test1([(n: -1), 6, 7, 8]));
  Expect.equals("default", test1([(n: -1, 42), 6, 7, 8]));
  Expect.equals("default", test1([1, 2]));
  Expect.equals("default", test2([1, 2, 3, 4, (42,)]));
  Expect.equals("default", test2([1, 2, 3, 4, (n: -1)]));
  Expect.equals("default", test2([1, 2, 3, 4, (n: -1, 42)]));
  Expect.equals("default", test2([2, (42,), 5, 6]));
  Expect.equals("default", test2([2, (n: -1), 5, 6]));
  Expect.equals("default", test2([2, (n: -1, 42), 5, 6]));
  Expect.equals("default", test2([(42,), 6, 7, 8]));
  Expect.equals("default", test2([(n: -1), 6, 7, 8]));
  Expect.equals("default", test2([(n: -1, 42), 6, 7, 8]));
  Expect.equals("default", test2([1, 2]));
  Expect.equals("default", test3([1, 2, 3, 4, (42,)]));
  Expect.equals("default", test3([1, 2, 3, 4, (n: -1)]));
  Expect.equals("default", test3([1, 2, 3, 4, (n: -1, 42)]));
  Expect.equals("default", test3([2, (42,), 5, 6]));
  Expect.equals("default", test3([2, (n: -1), 5, 6]));
  Expect.equals("default", test3([2, (n: -1, 42), 5, 6]));
  Expect.equals("default", test3([(42,), 6, 7, 8]));
  Expect.equals("default", test3([(n: -1), 6, 7, 8]));
  Expect.equals("default", test3([(n: -1, 42), 6, 7, 8]));
  Expect.equals("default", test3([1, 2]));
}
