/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The switch statement supports dispatching control among a large
 * number of cases.
 * switchStatement:
 *   switch '(' expression ')' '{' switchCase* defaultCase? '}'
 * ;
 * switchCase:
 *   label* case expression ':' statements
 * ;
 * defaultCase:
 *   label* default ':' statements
 * ;
 * @description Checks that nested switch statements modifying the same
 * variables work correctly.
 * @author vasya
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

foo(value, value2) {
  var result;

  switch (value) {
    case 0:
      result = "0";
      switch (value2) {
        case "foo": result = "${result}FOO"; break;
        case "bar": result = "${result}BAR"; break;
        default: result = "${result}NULL";
      }
      break;
    default: result = "NULL";
  }
  return result;
}


main() {
  Expect.equals("0FOO", foo(0, "foo"));
  Expect.equals("NULL", foo(1, "foo"));
  Expect.equals("0BAR", foo(0, "bar"));
  Expect.equals("NULL", foo(1, "bar"));
  Expect.equals("0NULL", foo(0, null));
  Expect.equals("NULL", foo(null, null));
}
