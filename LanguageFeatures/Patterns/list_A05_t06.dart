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
/// @description Check that constant subpattern can be used in a list's rest
/// pattern
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart" as p;
import "../../Utils/expect.dart";

class C {
  static const c = 42;
  const C();
}

String test1(List list) {
  return switch (list) {
    <int>[1, 2, 3, 4, ... 42] => "case-1",
    [2, ...'Lily was here', 5, 6] => "case-2",
    <int>[.../* comment */ null, 6, 7, 8] => "case-3",
    _ => "default"
  };
}

String test2(List list) {
  switch (list) {
    case <int>[1, 2, 3, 4, ... const (1 + 2)]:
      return "case-1";
    case [2, ...const C(), 5, 6]:
      return "case-2";
    case <int>[... /* comment */ C.c, 6, 7, 8]:
      return "case-3";
    default:
      return "default";
  }
}

String test3(List list) {
  if (list case <int>[1, 2, 3, 4, ... p.Zero]) {
    return r1.toString();
  }
  if (list case [2, ...p.C0.Zero, 5, 6]) {
    return r2.toString();
  }
  if (list case <int>[... /* comment */ p.Color.white, 6, 7, 8]) {
    return r3.toString();
  }
  return "default";
}

main() {
  Expect.equals("default".toString(), test1([1, 2, 3, 4, 5, 6]));
  Expect.equals("default".toString(), test1([2, 3, 4, 5, 6]));
  Expect.equals("default".toString(), test1([3, 4, 5, 6, 7, 8]));
  Expect.equals("default", test1([1, 2]));
  Expect.equals("default".toString(), test2([1, 2, 3, 4, 5, 6]));
  Expect.equals("default".toString(), test2([2, 3, 4, 5, 6]));
  Expect.equals("default".toString(), test2([3, 4, 5, 6, 7, 8]));
  Expect.equals("default", test2([1, 2]));
  Expect.equals("default".toString(), test3([1, 2, 3, 4, 5, 6]));
  Expect.equals("default".toString(), test3([2, 3, 4, 5, 6]));
  Expect.equals("default".toString(), test3([3, 4, 5, 6, 7, 8]));
  Expect.equals("default", test3([1, 2]));
}
