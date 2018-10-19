/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Mixin application semantics is mostly unchanged, except that it's
 * a compile-time error to apply a mixin to a class that doesn't implement all
 * the 'on' type requirements of the mixin declaration, or apply a mixin
 * containing super-invocations to a class that doesn't have a concrete
 * implementation of the super-invoked members compatible with the
 * super-constraint interface.
 *
 * @description Checks that it is a compile error if a mixin is applied to a
 * class that does not implement all the 'on' type requirements of the mixin
 * declaration.
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

class S {}
class T {}
class X extends S {}
class Y extends T {}

class I<T> {}
class J<T> {}
class B<T> {}
class C<T> {}

mixin M<X extends S, Y extends T> on B<X>, C<Y> implements I<S>, J<T> {
}

class A<T1, T2, T3, T4> implements B<T1>, C<T2>, I<T3>, J<T4> {
}

class MA extends A<X, Y, S, S> with M<X, Y> {
}

main() {
  MA ma = new MA();
}
