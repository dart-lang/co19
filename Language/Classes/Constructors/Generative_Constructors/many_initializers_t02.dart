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
 * (referenced as this.name).
 * @compile-error
 * @author iefremov
 */

class C {
  C(x, y) : this.x = x, h = null, z = 0, w = "", this.x = y;
  var x;
  var h;
  var z;
  var w;
}

main() {
  try {
    C c = new C(0, 1);
    print(c.x);
  } catch (x) {}
}
