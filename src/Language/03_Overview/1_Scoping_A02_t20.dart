/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Names in nested scopes may hide names in lexically enclosing scopes, however,
 * it is a static warning if a declaration introduces a name that is available in a
 * lexically enclosing scope.
 * @description Checks that no static warning is produced when a variable is initialized at declaration
 * with a function literal that has the same name because the name of that variable is not in the scope
 * of its own initialization expression.
 * @author iefremov
 * @reviewer rodionov
 */

main() {
  var x = x(){ return x;};
  Expect.isTrue(x() is Function);
}
