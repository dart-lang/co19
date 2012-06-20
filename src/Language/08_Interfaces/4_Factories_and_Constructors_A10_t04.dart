/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the default factory clause of I includes a list of type parameters tps, then
 * tps must be identical to the type parameters given in the declaration of F, or a
 * compile-time error occurs
 * @description Checks that a compile-time error occurs if the type parameters given in 
 * the factory clause of an interface and those given in the type declaration of the factory class
 * have completely different names.
 * @compile-error
 * @author rodionov
 * @reviewer kaigorodov
 */

class F<A, B> implements I<A, B> {
  F() {}
}

interface I<C, D> default F<C, D> {
  I();
}

main() {
  try {
    new I();
  } catch(var e) {}
}

