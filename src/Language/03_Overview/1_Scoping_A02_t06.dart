/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a declaration d named n is in the namespace induced by a scope S, 
 * then d hides any declaration named n that is available in the lexically enclosing 
 * scope of S. 
 * It is a static warning if a declaration hides a name in a lexically enclosing
 * scope, unless such hiding is explicitly permitted by this specification.
 * @description Checks that that a static warning is produced if a type variable hides a class name.
 * Checks also that a type variable really hides a class name - using it in a new expression causes
 * a compile-time error.
 * @static-warning
 * @compile-error
 * @author iefremov
 * @reviewer rodionov
 */

class C {}
class G<C> {
  G() {
    new C(); // non-static scope - type variable shadows the class name
  }
}

main() {
  try {
    new G();
  } catch(var x){}
}
