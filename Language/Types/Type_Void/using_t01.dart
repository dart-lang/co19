/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Hence, the static checker will issue warnings if one attempts to
 * access a member of the result of a void method invocation (even for members
 * of null, such as ==). Likewise, passing the result of a void method as a
 * parameter or assigning it to a variable will cause a warning unless the
 * variable/formal parameter has type dynamic.
 * @description Checks that using the result of a void method invocation in an
 * expression results in a compile error.
 * @compile-error
 * @author rodionov
 * @needsreview Assertion of this test cites non-normative text.
 * Possibly, this text in the spec should be normative?
 */

void foo() {return;}

main() {
  bool b = (foo() == 1);
}
