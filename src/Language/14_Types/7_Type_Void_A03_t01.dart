/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Passing the result of a void method as a parameter or assigning it to a 
 * variable will cause a warning unless the variable/formal parameter has type dynamic.
 * @description Checks that assigning the result of a void method invocation to a variable
 * whose declared type is not dynamic results in a static warning.
 * @author rodionov
 * @reviewer iefremov
 * @static-warning
 * @needsreview Assertion of this test cites non-normative text.
 * Possibly, this text in the spec should be normative?
 */

void foo() {return;}

main() {
  int i = foo();
}
