/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Names in nested scopes may hide names in lexically enclosing scopes, however,
 * it is a static warning if a declaration introduces a name that is available in a
 * lexically enclosing scope.
 * @description Checks that a static warning is produced if a local variable
 * declared inside a do-while loop shadows another local variable declared in an
 * enclosing lexical scope.
 * @author iefremov
 * @static-warning
 * @reviewer rodionov
 */

var flag = false;
once() {
  if(flag) {
    return flag;
  }
  flag = true;
  return false;
}

main() {
  var x = 1;
  do var x = 42; while(once());
  Expect.equals(1, x);
}
