/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The formal parameters of a method is a (possibly empty) list of positional
 * parameters optionally followed by either a rest parameter or a section with named
 * optional parameters.
 * @description Tests a trivial optional parameter.
 * @author pagolubev
 * @reviewer iefremov
 */

class A {
  static void foo([int x]) {
    return x;
  }
}


main() {
  Expect.isTrue(A.foo(1) == 1);
}
