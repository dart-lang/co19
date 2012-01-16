/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An interface has a set of direct superinterfaces. This set consists of the interfaces
 * specified in the extends clause of the interface.
 * superinterfaces:
 *   extends typeList
 * ;
 * @description Checks that an interface can declare generic and non-generic direct superinterfaces
 * or not declare any.
 * @author vasya
 * @reviewer rodionov
 */

interface J {}
interface I extends J {}

interface J1 {}
interface J2 extends J1 {} 
interface J3 extends J2 {}
interface I1 extends J1, J2, J3 {}
interface I2 extends J3, J2, J1 {}

interface K<S> {}
interface L<S> extends K<S> {}

interface A<S, T> {}
interface B<S, T> extends A<T, S> {} 
interface C<Q, R, S> extends A<Q, S> {}
interface D<Q> extends A<int, Q>, J, I {}

main() {
}

