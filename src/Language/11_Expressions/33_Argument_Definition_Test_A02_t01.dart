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
 * @reviewer kaigorodov
 */
import "../../Utils/expect.dart";
main() {
  (x, [y]) {
    Expect.isTrue(?x && ?y);
  }(null, null);

  (x, [y]) {
    Expect.isTrue(?x && ?y);
  }(1, 1);

  (x, [y]) {
    Expect.isTrue(?x);
    Expect.isFalse(?y);
  }(null);

  (x, [y = 1]) {
    Expect.isTrue(?x);
    Expect.isFalse(?y);
  }(1);

  (x, {y}) {
    Expect.isTrue(?x);
    Expect.isFalse(?y);
  }(null);

  (x, {y: 1}) {
    Expect.isTrue(?x);
    Expect.isFalse(?y);
  }(1);

  (x, {y: 1}) {
    Expect.isTrue(?x && ?y);
  }(1, y:null);
  
  bool foo([x]) => !?x;
  Expect.isFalse(foo(null));
  Expect.isTrue(foo());
}
