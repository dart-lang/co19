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
 * converts to the boolean false, then the statement s2 is executed.
 * Boolean false constant is tested as well as various comparison expressions.
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */
import '../../../Utils/expect.dart';

main() {
  var i = 0;
  if (false) {
    i = 1;
  } else {
    i = 2;
  }
  Expect.equals(2, i);

  i = 0;
  if ( 0 > 1 ) {
    i = 1;
  } else {
    i = 2;
  }
  Expect.equals(2, i);

  i = 0;
  if ( "".length > 0 ) {
    i = 1;
  } else {
    i = 2;
  }
  Expect.equals(2, i);

  i = 0;
  if ( [].length == 1 ) {
    i = 1;
  } else {
    i = 2;
  }
  Expect.equals(2, i);
}
