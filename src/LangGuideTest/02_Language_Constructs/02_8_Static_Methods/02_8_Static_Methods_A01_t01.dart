/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Static methods are declared using the static keyword.
 * They are referenced by prefixing the method name by the class-name followed by a dot.
 * @description Checks static method referencing.
 * @author pagolubev
 * @reviewer iefremov
 */

class A {
  static int foo() { return 1; }
  static int bar() { return foo(); }
}


main() {
  Expect.isTrue(1 == A.foo());
  Expect.isTrue(1 == A.bar());
}
