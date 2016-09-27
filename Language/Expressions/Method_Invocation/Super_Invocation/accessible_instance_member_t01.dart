/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let Sstatic be the superclass of the immediately enclosing class.
 * It is a static type warning if Sstatic does not have an accessible instance
 * member named m unless Sstatic or a superinterface of Sstatic is annotated
 * with an annotation denoting a constant identical to the constant @proxy
 * deﬁned in dart:core.
 * @description Checks that it is a compile error if S does not have
 * an instance member named m.
 * @compile-error
 * @author msyabro
 * @reviewer kaigorodov
 */

class S {}

class A extends S {
  test() {
    super.m();
  }
}

main() {
  new A().test();
}
