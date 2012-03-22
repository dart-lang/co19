/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Names in nested scopes may hide names in lexically enclosing scopes, however,
 * it is a static warning if a declaration introduces a name that is available in a
 * lexically enclosing scope.
 * @description Checks that that a static warning is produced if a type variable hides a class name.
 * Checks also that a type variable really hides a class name - using it in a new expression causes
 * a compile-time error.
 * @static-warning
 * @compile-error
 * @author iefremov
 */

class C {}
class G<C> {
  G() {
    new C();
  }
}

main() {
  try {
    new G();
  } catch(var x){}
}