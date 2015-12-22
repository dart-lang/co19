/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Execution of the body terminates when the first of
 * the following occurs:
 *  • An exception is thrown and not caught within the current function
 *    activation.
 *  • A return statement immediately nested in the body of f is executed and
 *    not intercepted in a finally clause.
 *  • The last statement of the body completes execution.
 * @description Checks that execution of a function body terminates after
 * a return statement
 * @author msyabro
 * @reviewer kaigorodov
 */
import '../../../Utils/expect.dart';

int x;

void f() {
  return;
  x = 1;
}

main() {
  f();
  Expect.isNull(x);
}
