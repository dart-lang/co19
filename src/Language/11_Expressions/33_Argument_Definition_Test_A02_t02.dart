/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An argument definition test e of the form ?v evaluates to true iff 
 * the currently executing invocation of the function that declares v explicitly
 * provided an argument for the formal parameter v; otherwise e evaluates to false.
 * @description Checks that an argument definition test expression is evaluated
 * correctly for both required and optional arguments in various scenarios and
 * that it can be used anywhere a primary expression can. 
 * @author rodionov
 * @issue 7603
 */
main() {
  ([x]) {
    ({y}) {
      (z) {
        Expect.isFalse(?x);
        Expect.isTrue(?y);
        Expect.isTrue(?z);
      }(y);
    }(y: ?x);
  }();
}
