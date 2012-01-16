/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The type parameters of a generic G are in scope in the bounds of all of
 * the type parameters of G. The type parameters of a generic class or interface
 * declaration G are also in scope in the extends and implements clauses of G
 * (if these exist) and in the non-static members of G.
 * @description Checks that type parameters are in scope in the type parameters bounds.
 * @author iefremov
 * @needsreview issue 987
 */

class A<T extends T,
        U extends T,
        V extends A<T, U, V>>
{ }

class B<T extends V, V> {}

interface I<T extends T,
        U extends T,
        V extends I<T, U, V>>
{ }

interface J<T extends V, V> {}
class IC implements I, J{}

typedef f<T extends T,
        U extends T,
        V extends f<T, U, V>> ();

typedef j<T extends V, V>();


main() {
  new A<num, double, A>();
  new B<int, num>();
  f z1;
  j z2;
  new IC();
}
