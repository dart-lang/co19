/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Dart is lexically scoped and uses a single namespace for variables, functions and types.
 * It is a compile-time error if there is more than one entity, other than a setter and a getter,
 * with the same name declared in the same scope.
 * @description Checks that a name from the current lexical scope does not conflict
 * with names in other scopes.
 * @static-warning
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer iefremov
 */

var x = 0;
f() {return x;}
g() {var x = 1; return f();}

main() {
  Expect.equals(0, g());
}