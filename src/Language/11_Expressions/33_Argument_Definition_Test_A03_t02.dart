/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of an argument definition test is bool.
 * @description Checks that the static type is indeed bool by ensuring that
 * there're static warnings when the result of an argument definition
 * test expression is being assigned to a variable of incompatible type,
 * returned from a function that declares an incompatible return type
 * or being passed as a function parameter that is declared to have a type
 * bool is not assignable to.
 * @static-warning
 * @author rodionov
 * @reviewer kaigorodov
 */
int boolfunc(Map b) {
  String foo = ?b; /// static type warning
  return !?b; /// static type warning
}

main() {
  (x) {
    List foo = ?x; /// static type warning
    boolfunc(?x); /// static type warning
    return ?x;
  };
}
