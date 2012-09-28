/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a declaration d named n is in the namespace induced by a scope S, 
 * then d hides any declaration named n that is available in the lexically enclosing 
 * scope of S. 
 * @description Checks that it is a static warning and a dynamic error when a type
 * parameter hides a class name declared in an enclosing scope and it's referenced
 * in a static context.
 * @static-warning
 * @author iefremov
 * @reviewer rodionov
 */

class C {}
class G<C> {
  static f() => new C(); // Dart no longer resolves this to the hidden type
}

main() {
  try {
    G.f();
    Expect.fail("Should throw an exception");
  } catch(x){}
}
