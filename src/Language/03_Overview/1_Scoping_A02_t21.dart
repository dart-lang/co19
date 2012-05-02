/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Names in nested scopes may hide names in lexically enclosing scopes, however,
 * it is a static warning if a declaration introduces a name that is available in a
 * lexically enclosing scope.
 * @description Checks that a static warning is produced when a function literal is introduced
 * with the same name as a variable from an enclosing lexical scope.
 * @author iefremov
 * @reviewer rodionov
 * @static-warning
 */

main() {
  var x;
  x = x(){ return x;};
  Expect.isTrue(x() is Function);
}
