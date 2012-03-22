/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Names in nested scopes may hide names in lexically enclosing scopes, however,
 * it is a static warning if a declaration introduces a name that is available in a
 * lexically enclosing scope.
 * @description Checks that name in the current scope is used instead of the hidden name.
 * @static-warning
 * @author msyabro
 * @reviewer iefremov
 */

main() {
  var x = 1;
  {
    var x = 0;
    Expect.equals(1, ++x);
    () {
      var x = 2;
      Expect.equals(3, ++x);
    }();
  }
  Expect.equals(1, x);
  () {
    var x = 42;
    Expect.equals(43, ++x);
    {
      var x = 100500;
      Expect.equals(100501, ++x);
    }
    Expect.equals(43, x);
  }();
}
