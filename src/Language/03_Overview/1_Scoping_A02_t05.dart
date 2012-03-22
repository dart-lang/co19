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
 * Checks also that using a type variable name in a static context causes a compile-time error.
 * @static-warning
 * @compile-error
 * @author iefremov
 * @needsreview Not sure if I deduced this test correctly.
 * @needsreview Issue 2241
 */

class C {}
class G<C> {
  static f() => new C();
}

main() {
  try {
    G.f();
  } catch(var x){}
}