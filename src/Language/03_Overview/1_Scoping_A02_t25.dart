/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Names in nested scopes may hide names in lexically enclosing scopes, however,
 * it is a static warning if a declaration introduces a name that is available in a
 * lexically enclosing scope.
 * @description Checks that a type parameter correctly hides a function type alias and
 * a static warning is produced.
 * @static-warning
 * @author iefremov
 * @reviewer rodionov
 */

typedef foo();

class C<foo> {
  C(foo boo) {
    foo f = boo; //checked mode should not complain
  }
}

main() {
  new C<int>(1);
}
