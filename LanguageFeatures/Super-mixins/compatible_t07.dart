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
 * @description Checks that there is no compile error if a mixin is applied to a
 * class that implements all the 'on' type requirements of the mixin
 * declaration. Test 'mixin' implementation of 'on' clause interfaces
 * @author sgrekhov@unipro.ru
 */

class S {}
class T {}
class X extends S {}
class Y extends T {}

String console;

class A<T> {
}
abstract class B<T> {
}

class C<X, Y> extends B<Y> with A<X> {
}

mixin M<X extends S, Y extends T> on A<Y>, B<Y> {
}

class MA extends C<X, Y> with M<X, Y> {
}

main() {
  MA ma = new MA();
}
