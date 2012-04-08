/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Names in nested scopes may hide names in lexically enclosing scopes, however,
 * it is a static warning if a declaration introduces a name that is available in a
 * lexically enclosing scope.
 * @description Checks that a hidden class name can't be used as a type.
 * @static-warning
 * @compile-error
 * @author msyabro
 * @reviewer iefremov
 */

class C {}

main() {
  var C = 1;
  try {
    new C(); //'C' can't be used as a type in this scope.
  } catch(var e) {}
}