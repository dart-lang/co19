/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An argument definition test is an expression that tests whether 
 * a formal parameter is bound to an object explicitly passed to a method or function.
 * argumentDefinitionTest:
 *   `?' identifier
 * ;
 * It is a compile time error if v does not denote a formal parameter.
 * @description Checks that it is a compile-time error when the identifier in an
 * argument definition test is 'null'.
 * @compile-error
 * @author rodionov
 * @reviewer kaigorodov
 */
main() {
  try {
    ?null;
  } catch (ok) {}
}
