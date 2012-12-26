/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of an argument definition test is bool.
 * @description Checks that the static type is indeed bool by ensuring that
 * there're no static warnings when the result of an argument definition
 * test expression is being assigned to a bool variable, returned from 
 * a bool function or being passed as a function parameter which has its type
 * specified as bool in that function's declaration.
 * @static-clean
 * @author rodionov
 */

bool boolfunc(bool b) {
  bool foo = ?b;
  return !?b;
}

main() {
  (x) {
    bool foo = ?x;
    boolfunc(?x);
    return ?x;
  };
}
