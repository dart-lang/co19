/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Further, the interfaces B and C must be compatible. The on clause
 * introduces a synthetic interface combining B and C, call it A$super, which is
 * equivalent to the interface of a class declaration of the form:
 *   abstract class A$super<X extends S, Y extends T> implements B, C {}
 * It is a compile-time error for the mixin declaration if the class declaration
 * above would not be valid.
 *
 * @description Checks that it is a compile-time error for the mixin declaration
 * if the interfaces B and C are not compatible.
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

class S {}
class T {}
class X extends S {}
class Y extends T {}

class I<T> {
}
abstract class J<T> {
}

class A<T> {
}
abstract class B<T> extends A<T> {
}
class C<T, S> extends B<T> implements J<S> {
}

mixin M<X extends S, Y extends T> on A<X>, B<X> implements I<X>, J<X> {}  //# 01: compile-time error
class MA extends C<X, Y> with M<X, Y> {}                                  //# 01: compile-time error

mixin M<X extends S, Y extends T> on A<X>, B<Y> implements I<X>, J<Y> {}  //# 02: compile-time error
class MA extends C<X, Y> with M<X, Y> {}                                  //# 02: compile-time error

mixin M<X extends S, Y extends T> on A<Y>, B<X> implements I<X>, J<Y> {}  //# 03: compile-time error
class MA extends C<X, Y> with M<X, Y> {}                                  //# 03: compile-time error

main() {
}

