/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is possible to embed expressions within non-raw string
 * literals, such that these expressions are evaluated, and the resulting
 * values are converted into strings and concatenated with the enclosing
 * string. This process is known as string interpolation.
 * stringInterpolation:
 *   '$' IDENTIFIER_NO_DOLLAR |
 *   '$' '{' expression '}'
 * ;
 * @description Checks that it is not a compile-time error if the string
 * interpolation expression is a top-level method name (not invocation).
 * @author kaigorodov
 * @reviewer rodionov
 * @note issue 3994
 */

foo() {}

main() {
  "${foo}";
}
