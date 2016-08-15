/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let k be a generative constructor. It is a compile-time error if
 * more than one initializer corresponding to a given instance variable appears
 * in k's initializer list.
 * @description Checks that a compile-time error is produced if the same
 * instance variable is initialized more than once in an initializer list
 * (referenced as both this.name and just name).
 * @compile-error
 * @author rodionov
 */

class C {
  C() : x = 1, y = 2, this.x = 3;
  var x;
  var y;
}

main() {
  try {
    C c = new C();
    print(c.x);
  } catch (x) {}
}
