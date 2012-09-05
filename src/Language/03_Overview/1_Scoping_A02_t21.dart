/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a declaration d named n is in the namespace induced by a scope S, 
 * then d hides any declaration named n that is available in the lexically enclosing 
 * scope of S. 
 * @description Checks that no static warning is produced when a function literal is introduced
 * with the same name as a variable from an enclosing lexical scope.
 * @author iefremov
 * @reviewer rodionov
 */

main() {
  var x;
  x = x() { return x;};
  Expect.isTrue(x() is Function);
}
