/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if an instance method m1 overrides an instance member m2,
 * the signature of m2 explicitly specifies a default value for a formal parameter p
 * and the signature of m1 specifies a different default value for p.
 * @description Checks that there is static warnings if the overriden method does not
 * explicitly specify a default value for its optional parameter and overriding method
 * does explicitly specify a default value for its optional parameter.
 * @static-warning
 * @author msyabro
 * @reviewer kaigorodov
 */

class A {
  foo([x]) {}
}

class C extends A {
  foo([x = 1]) {}
}

main() {
  (new A()).foo(2);
  (new C()).foo(1);
}

