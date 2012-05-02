/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Names in nested scopes may hide names in lexically enclosing scopes, however,
 * it is a static warning if a declaration introduces a name that is available in a
 * lexically enclosing scope.
 * @description Checks that it is possible to initialize a variable v with the value of 
 * a variable it shadows.
 * Checks that a static warning is produced as well.
 * @author iefremov
 * @static-warning
 * @reviewer rodionov
 */

var f = 1;

main() {
  var f = f;
  Expect.equals(1, f);
}
