/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If F implements I, and F is generic, then then the factory clause of I must
 * include a list of type parameters that is identical to the type parameters given
 * in the type declaration of F, or a compile-time error occurs.
 * @description Checks that a compile-time error occurs if the type parameter in the factory clause
 * directly violates the type parameter bound imposed by the factory class declaration.
 * @compile-error
 * @author vasya
 * @reviewer rodionov
 * @reviewer kaigorodov
 */

class F<S extends String> implements I<S> {
  F() {}
}

interface I<X extends String> default F<int> {
  I();
}

main() {
  try {
    new I();
  } catch(var e) {}
}
