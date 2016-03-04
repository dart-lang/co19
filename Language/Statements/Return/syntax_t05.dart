/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The return statement returns a result to the caller of a
 * synchronous function, completes the future associated with an asynchronous
 * function or terminates the stream or iterable associated with a generator.
 * returnStatement:
 *   return expression? ';'
 * ;
 * @description Checks that a function is allowed to have more than one return
 * statement, even if it's a trivial case of unreachable code.
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */
import '../../../Utils/expect.dart';

foo(val) {
  if (val > 0) {
    return true;
  } else if (val <= 0) {
    return false;
  }

  return 0;
  return null;
  return "abracadabra";
}

main() {
  Expect.equals(true, foo(1));
  Expect.equals(false, foo(-1));
}
