/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if a class C declares an instance method
 * named n and has a setter named n=.
 * @description Checks that it is a static warning if a class C declares an
 * instance method named n and inherits a setter named n=.
 * @static-warning
 * @author kaigorodov
 */

class A {
  set foo(int a) {}
}

class C extends A {
  foo() {}
}

main() {
  C c=new C();
    c.foo();
//    c.foo=1;
}
