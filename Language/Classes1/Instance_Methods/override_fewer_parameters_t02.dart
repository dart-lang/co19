/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if an instance method m1 overrides an
 * instance member m2 and m1 has fewer positional parameters than m2.
 * @description Checks that a compile error is produced if m1 has fewer
 * optional positional parameters than m2 (2 vs 3) and neither have any 
 * required parameters.
 * @compile-error
 * @author vasya
 */

class A {
  f([var x, var y, var z]) {}
}

class C extends A {
  f([var x, var y]) {}
}

main() {
  new A().f(1, 2, 3);
  new C().f(1, 2);
}
