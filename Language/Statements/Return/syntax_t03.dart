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
 * @description Checks that it is a compile-time error if a return statement
 * does not end with a semicolon.
 * @compile-error
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */

foo() {
  return "foo"
}

main() {
  try {
    foo();
  } catch (x) {}
}
