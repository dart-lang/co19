/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static checker will issue warnings if one attempts to access a member 
 * of the result of a void method invocation (even for members of null, such as ==).
 * @description Checks that using the result of a void method invocation in an expression
 * results in a static warning.
 * @author rodionov
 * @reviewer iefremov
 * @static-warning
 * @needsreview Assertion of this test cites non-normative text.
 * Possibly, this text in the spec should be normative?
 */

void foo() {return;}

main() {
  bool b = (foo() == 1);
}

