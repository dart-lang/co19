/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Names in nested scopes may hide names in lexically enclosing scopes, however,
 * it is a static warning if a declaration introduces a name that is available in a
 * lexically enclosing scope.
 * @description Checks that a hidden function name can't be used as a function.
 * @static-warning
 * @author msyabro
 * @reviewer iefremov
 */

f() {}
main() {
  var f = 1;
  try {
    f(); //'f' can't be used as a function in this scope.
  } catch(var e) {}
}