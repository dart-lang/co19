/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Names in nested scopes may hide names in lexically enclosing scopes, however,
 * it is a static warning if a declaration introduces a name that is available in a
 * lexically enclosing scope.
 * @description Checks that labels and variables do not hide each other and no warnings are produced.
 * @author iefremov
 */


main() {
  var v = 54;
  {
    v: 1+1;
    Expect.equals(54, v);
    {
      l: 1 + 1;
      var l = 45;
      Expect.equals(45, l);
    }
  }
}