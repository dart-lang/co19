/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a declaration d named n is in the namespace induced by a scope S, 
 * then d hides any declaration named n that is available in the lexically enclosing 
 * scope of S. 
 * @description Checks that that no static warning is produced if a type variable hides a class name.
 * Checks also that a type variable really hides a class name by making sure that using it in a new 
 * expression results in a compile-time error.
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
  } catch(x){}
}
