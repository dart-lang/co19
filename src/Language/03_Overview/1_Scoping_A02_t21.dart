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
