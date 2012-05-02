/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Names in nested scopes may hide names in lexically enclosing scopes, however,
 * it is a static warning if a declaration introduces a name that is available in a
 * lexically enclosing scope.
 * @description Checks that variables declared in different case clauses of a switch statement
 * do not shadow each other.
 * @author iefremov
 * @reviewer rodionov
 */

main() {
  switch(1) {
    case 1:
      var x;
      break;
    case 2:
      var x;
      break;
  }
}
