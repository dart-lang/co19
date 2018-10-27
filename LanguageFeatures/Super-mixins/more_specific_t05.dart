/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If more than one super-constraint interface declares a member
 * with  the same name, at least one of those members is more specific than the
 * rest,  and this is the unique signature that super-invocations are allowed
 * to invoke.
 *
 * @description Checks that if more than one super-constraint interface declares
 * a member with the same name, at least one of those members is more specific
 * than the rest, and this is the unique signature that super-invocations are
 * allowed to invoke. Test type parameters
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

class S {}
class X extends S {}

class I {}
class J {}

abstract class B<T1> {
  T1 foo(T1 t1);
}
abstract class C<T1> {
  T1 foo(T1 t1);
}

mixin M<T1 extends S> on B<T1>, C<T1> implements I, J {
  test(T1 t) {
    Expect.isTrue(super.foo(t) is X);
  }
}

class A<T1 extends S> implements B<T1>, C<T1> {
  T1 foo(T1 t1) => t1;
}

class MA extends A<X> with M<X> {
}

main() {
  MA ma = new MA();
  ma.test(new X());
}
