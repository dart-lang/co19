/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Execution of an if statement of the form if (b) s1 else s2
 * proceeds as follows:
 * . . .
 * If r is true, then the statement {s1} is executed, otherwise statement {s2}
 * is executed.
 * @description Checks that if the expression b evaluates to an object o that
 * converts to the boolean true, then the statement s1 is executed.
 * Boolean true constant is tested as well as various comparison expressions.
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */
import '../../../Utils/expect.dart';

main() {
  var i = 0;
  if (true) {
    i = 1;
  } else {
    i = 2;
  }
  Expect.equals(1, i);

  i = 0;
  if ( 2 > -1 ) {
    i = 1;
  } else {
    i = 2;
  }
  Expect.equals(1, i);

  i = 0;
  if ( "str".length > 0 ) {
    i = 1;
  } else {
    i = 2;
  }
  Expect.equals(1, i);

  i = 0;
  if ( [].length == 0 ) {
    i = 1;
  } else {
    i = 2;
  }
  Expect.equals(1, i);
}
