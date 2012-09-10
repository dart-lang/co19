/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the default factory clause of I includes a list of type parameters tps, then
 * tps must be identical to the type parameters given in the declaration of F, or a
 * compile-time error occurs
 * @description Checks that renaming type arguments between the factory clause
 * and the factory class declaration causes a compile-time error.
 * @compile-error
 * @author rodionov
 * @reviewer kaigorodov
 */

class F<Q, R> {
  factory I(Q q, R r) {}
}

interface I<S, T> default F<S, T> {
  I(S s, T t);
}

main() {
  try {
    new I<int, String>(null, null);
  } catch(e) {}
}

