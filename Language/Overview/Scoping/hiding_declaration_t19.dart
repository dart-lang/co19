/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a declaration d named n is in the namespace induced by a scope S, 
 * then d hides any declaration named n that is available in the lexically enclosing 
 * scope of S. 
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
