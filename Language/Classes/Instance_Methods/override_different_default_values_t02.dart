/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if an instance method m1 overrides an 
 * instance member m2, the signature of m2 explicitly specifies a default 
 * value for a formal parameter p and the signature of m1 specifies a different 
 * default value for p.
 * @description Checks that it is a static warning if overridden method
 * explicitly specifies a default non-null value for its optional parameter and 
 * overriding method does not.
 * @issue 27476
 * @static-warning
 * @author msyabro
 */

class A {
  foo([x = 0]) {}
}

class C extends A {
  foo([x]) { /// static type warning
  }
}

main() {
  new A().foo(2);
  new C().foo(1);
}
