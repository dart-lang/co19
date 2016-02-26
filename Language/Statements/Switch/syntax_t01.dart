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
 * @description Checks that a switch statement with all kinds of case
 * expressions (as long as they're allowed by spec) works as expected.
 * @author rodionov
 * @reviewer iefremov
 * @issue 7537
 */
import '../../../Utils/expect.dart';

switchTestBool(value) {
  var result;

  switch (value) {
    case true:
      {result = 1;}
      break;

    label: case false && true:
      result = 2;
      break;

    default:
      result = -1;
  }
  return result;
}

switchTestInt(value) {
  var result;

  switch (value) {
    case 1:
      {result = 1;}
      break;

    label: case 7 << 2:
      result = 2;
      break;

    case 1 ^ 5:
      result = 3;
      break;

    default:
      result = -1;
  }
  return result;
}

switchTestStr(value) {
  var result;

  switch (value) {
    case 'foo':
      {result = 1;}
      break;

    label: case r"""bar""":
      result = 2;
      break;

    default:
      result = -1;
  }
  return result;
}

main() {
  Expect.equals(1, switchTestBool(true));
  Expect.equals(2, switchTestBool(false));
  Expect.equals(-1, switchTestBool(null));

  Expect.equals(1, switchTestInt(1));
  Expect.equals(2, switchTestInt(28));
  Expect.equals(3, switchTestInt(4));
  Expect.equals(-1, switchTestInt(0));
  Expect.equals(-1, switchTestInt(null));

  Expect.equals(1, switchTestStr("foo"));
  Expect.equals(2, switchTestStr("bar"));
  Expect.equals(-1, switchTestStr(null));
  Expect.equals(-1, switchTestStr("abyrvalg"));

  switch (1) {
    case 0:
    case 1:
  }

  switch (1) {
    case 0:
    case 1:
    default:
  }

  switch (1) {}

  switch (1) {
    $: default:
  }

}
