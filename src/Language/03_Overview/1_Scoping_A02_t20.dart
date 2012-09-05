/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a declaration d named n is in the namespace induced by a scope S, 
 * then d hides any declaration named n that is available in the lexically enclosing 
 * scope of S. 
 * @description Checks that no static warning is produced when a variable is initialized at declaration
 * with a function literal that has the same name because the name of that variable is not in the scope
 * of its own initialization expression.
 * @author iefremov
 * @reviewer rodionov
 */

main() {
  var x = x() {return x;};
  Expect.isTrue(x() is Function);
}
