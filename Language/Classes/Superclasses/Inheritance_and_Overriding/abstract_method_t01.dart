/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if a non-abstract class inherits an
 * abstract method.
 * @description Checks that it is a compile error if a non-abstract class
 * inherits an abstract method.
 * @compile-error
 * @author msyabro
 */


abstract class A {
  foo();
}

class B extends A {
}

main() {
  try {
    (new B()).foo();
  } catch (e) {}
}
