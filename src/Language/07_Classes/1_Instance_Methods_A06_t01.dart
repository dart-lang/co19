/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if an instance method m1 overrides an
 * instance member m2 and m1 has fewer positional parameters than m2.
 * @description Checks that it is a static warning if an instance method m1
 * overrides an instance member m2 and m1 has fewer positional parameters
 * than m2.
 * @static-warning
 * @author kaigorodov
 * @reviewer rodionov
 */

class A {
  foo(var a, [x, y]) {}
}

class C extends A {
  foo(var a, [x]) {} /// static warning
}

main() {
  new A().foo(2);
  new C().foo(1);
}
