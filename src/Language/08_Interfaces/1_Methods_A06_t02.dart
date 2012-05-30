/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  It is a static warning if an interface method m1  overrides an interface method m2,
 * the signature of m2 explicitly specifies a default value for a formal parameter p
 * and the signature of m1 specifies a different default value for p.
 * @description Checks that it is a static warning if an interface method overrides an interface
 * method and does not specify the default value for a formal parameter while the method
 * in a superinterface does.
 * @static-warning
 * @author msyabro
 * @reviewer rodionov
 * @needsreview issue 3183
 */

interface S {
  foo([x = 1]);
}

interface I extends S {
  foo([x]);
}

class A implements I {
  foo([x]) {}
}

main() {
  new A().foo();
}
