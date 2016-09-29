/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let Sstatic be the superclass of the immediately enclosing class.
 * It is a static type warning if Sstatic does not have an accessible instance
 * method or getter named m.
 * @description Checks that it is a compile errorif the class of super in
 * a super.m invocation does not have a getter named m.
 * @compile-error
 * @author ilya
 */

class S {}

class C extends S {
  C() {
    super.foo;
  }
}

main() {
  new C();
}
