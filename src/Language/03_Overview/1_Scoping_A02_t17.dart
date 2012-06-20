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
 * @description Checks that it is possible to initialize a variable v with the value of 
 * a variable it shadows.
 * Checks that a static warning is produced as well.
 * @author iefremov
 * @static-warning
 * @reviewer rodionov
 */

var f = 1;

main() {
  var f = f;
  Expect.equals(1, f);
}
