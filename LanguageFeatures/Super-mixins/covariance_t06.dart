/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In a mixin declaration like
 * mixin A<X extends S, Y extends T> on B, C implements D, E { body }
 * the on clause declares the interfaces B and C as super-class constraints of
 * the mixin. Having a super-class constaint allows the mixin declaration
 * instance members to perform super-invocations (like super.foo()) if they are
 * allowed by a class implementing both B and C. The mixin introduced by A can
 * then only be applied to classes that implement both B and C.
 *
 * @description Checks that it is a compile error if mixin is applied to the
 * class which doesn't implement required interface
 * @compile-error
 * @issue 35111
 * @author sgrekhov@unipro.ru
 */

class A {
  covariant num number;
}

class B extends A {
  int number;
}

mixin M on A {
  test() {
    super.number = 3.14;
  }
}

class MA extends B with M {}

main() {
  new MA().test();
}
