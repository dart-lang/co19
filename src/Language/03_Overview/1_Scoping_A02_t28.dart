/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a declaration d named n is in the namespace induced by a scope S, 
 * then d hides any declaration named n that is available in the lexically enclosing 
 * scope of S. 
 * @description Checks that a hidden class name can't be used as a type.
 * @author msyabro
 * @reviewer iefremov
 */

class C {}

main() {
  var C = 1;
  try {
    new C(); /// static type warning: [12.11.1 New]: T is not a class accessible in the current scope
  } catch(e) {}
}
