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
class S {}
class T {}
class X extends S {}
class Y extends T {}

abstract class B<T1> {
  T1 foo(T1 x);
}

mixin M<T1 extends S, T2 extends T> on B<T2> {
  void test(T1 t1) {
    super.foo(t1);
  }
}

class C<T1> implements B<T1> {
  T1 foo(T1 x) => x;
}

class MA extends C<Y> with M<X, Y> {
}

main() {
  new MA().test(new X());
}
