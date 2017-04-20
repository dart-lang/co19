/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The type parameters of a generic G are in scope in the bounds of
 * all of the type parameters of G. The type parameters of a generic class
 * declaration G are also in scope in the extends and implements clauses of G
 * (if these exist) and in the body of G.
 * @description Checks that type parameters are in scope in the extends and
 * implements clauses of G (if G is a generic class declaration).
 * @issue 29388
 * @author iefremov
 */
class C<T, U> {}

class A<N, S, U> extends C<S, U> implements I<S, U, N>
{ }

abstract class J<U, V> {}

abstract class I<X, Y, Z> extends J<Y, Z>
{ }

main() {
  new A<num, double, A>();
}
