/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Unless explicitly stated otherwise, all ordinary rules that apply to methods
 * apply to abstract methods.
 * It is a compile error if an instance method m1 overrides an instance member
 * m2 and m1 has fewer positional parameters than m2.
 * @description Checks that a compile error is produced if m1 has fewer
 * optional positional parameters than abstract method m2 (2 vs 3) and neither
 * have any required parameters.
 * @compile-error
 * @author iefremov
 */

abstract class A {
  f([var x, var y, var z]);
}

class C extends A {
  f([var x, var y]) {}
}

main() {
  new C().f(1, 2);
}
