/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is possible to return the result of a void method from
 * within a void method. One can also return null; or a value of type Dynamic.
 * Returning any other result will cause a type warning (or a dynamic type error
 * in checked mode).
 * @description Checks that returning null or a value of type Dynamic 
 * from within a void method does not cause any errors.
 * @author rodionov
 * @reviewer iefremov
 * @needsreview Assertion of this test cites non-normative text.
 * Possibly, this text in the spec should be normative?
 */

void foo() {
  return null;
}

void bar(var v) {
  return v;
}

main() {
  foo();
  bar(1);
}

