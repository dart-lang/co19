/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It's a compile-time error if an instance method in a mixin body
 * has a super-access (super.foo, super.foo(), super + bar, etc.) which would
 * not be a valid invocation if super was replaced by an expression with static
 * type A$super.
 *
 * @description Checks that it is a compile error if an instance method in a
 * mixin body has a super-access (super.foo, super.foo(), super + bar, etc.)
 * which would not be a valid invocation if super was replaced by an expression
 * with static type A$super.
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

abstract class B {
  void foo(int x);
}

mixin M on B {
  void bar() {
    super.foo("test");
  }
}

class C implements B {
  void foo(int x) {}
}

class MA extends C with M {
}

main() {
  new MA().bar();
}