/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if an instance method m1 overrides an 
 * instance member m2 and m1 does not declare all the named parameters declared 
 * by m2.
 * @description Checks that a compile error is produced if m1 has almost the
 * same set of named parameters as m2 except for one of them having a different 
 * name.
 * @compile-error
 * @author rodionov
 */

class A {
  f({var x, var y, var z}) {}
}

class C extends A {
  f({var x, var y, var zz}) {}
}

main() {
  new A().f(x:"Nothing", y:"endures", z:"but");
  new C().f(x:"Nothing", y:"endures", zz:"but");
}
