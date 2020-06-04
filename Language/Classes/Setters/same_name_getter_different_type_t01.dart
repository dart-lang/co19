/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  It is a static warning if a class has a setter named v= with
 * argument type T and a getter named v with return type S, and S may not be
 * assigned to T
 * @description Checks that it is a static warning if a class has a setter named
 * v= with argument type T and a getter named v with return type S, and S may
 * not be assigned to T (int and String).
 * @static-warning
 * @author vasya
 * @issue 42179
 */

class C<T extends int, S extends String> {
  set foo(T t) {
    _foo = t;
  }

  S get foo { return _foo; }  /// static type warning

  var _foo;
}

main() {
  new C<int, String>().foo = 42;
}
