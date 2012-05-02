/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Names in nested scopes may hide names in lexically enclosing scopes, however,
 * it is a static warning if a declaration introduces a name that is available in a
 * lexically enclosing scope.
 * @description Checks that a warning is produced if a local variable introduces a name
 * that is identical to a function type alias available in the current scope.
 * @static-warning
 * @author iefremov
 * @reviewer rodionov
 */

typedef foo();

main() {
  var foo;
}
