/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The formal parameter list of a function introduces a new scope 
 * known as the function's formal parameter scope. The formal parameter scope 
 * of a function f is enclosed in the scope where f is declared.
 * Every formal parameter introduces a local variable into the formal parameter scope.
 * The body of a function introduces a new scope known as the function's body
 * scope. The body of a function f is enclosed in the scope introduced by formal
 * parameter scope of f.
 * @description Checks that the function scopes are enclosed in the scope where it's
 * declared and not the one where it's invoked.
 * @static-warning
 * @author rodionov
 * @reviewer kaigorodov
 */
import "../../Utils/expect.dart";

f() {
  try {
    var x = foo; /// static type warning call to unresolved getter 'foo'
    Expect.fail("NoSuchMethodError expected when calling undefined getter.");
  } on NoSuchMethodError catch (ex) {}
}

main () {
  var foo = 1;
  f();
}
