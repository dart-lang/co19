/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a declaration d named n is in the namespace induced by a scope S, 
 * then d hides any declaration named n that is available in the lexically enclosing 
 * scope of S. 
 * @description Checks that it is a dynamic error (type error specifically in checked mode)
 * when a type variable hides a class name declared in an enclosing scope and it's referenced 
 * in a static context (see Ch. 9 "Generics").
 * @static-warning
 * @author iefremov
 * @reviewer rodionov
 * @issue 5230
 */
import "../../Utils/dynamic_check.dart";

class C {}
class G<C> {
  static f() => new C(); /// static warning [12.11.1 New] It is a static warning if T is not a class accessible in the current scope
}

main() {
  try {
    G.f();
    Expect.fail("Error expected");
  } on Error catch(err) {
    Expect.isTrue(!isCheckedMode() || err is TypeError, "TypeError expected in checked mode.");
  }
}
