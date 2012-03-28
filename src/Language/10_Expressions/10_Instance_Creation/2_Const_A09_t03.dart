/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a constant object expression of either the form
 * const T.id(a1, .., an) or the form const T(a1, .., an) is T.
 * It is a static warning if the static type of ai, 1 <= i <= n+ k may not be assigned
 * to the type of the corresponding formal parameter of the constructor T.id (respectively T).
 * @description Checks that it is a static warning if the static type of arguments may not
 * be assigned to the type of the corresponding formal parameter of the invoked constant constructor T.id.
 * @static-warning
 * @author msyabro
 * @reviewer rodionov
 */

class A {
  const A.name(int p1, int p2);
}

main() {
  try {
    const A.name(1, "2");
  } catch(TypeError e) {}
}
