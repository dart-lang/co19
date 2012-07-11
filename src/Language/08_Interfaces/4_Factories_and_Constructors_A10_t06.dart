/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If F implements I, and F is generic, then then the factory clause of I must
 * include a list of type parameters that is identical to the type parameters given
 * in the type declaration of F, or a compile-time error occurs.
 * @description Checks that a compile-time error occurs if the the factory clause of the interface
 * and the type declaration of its factory class do not have the same number of type parameters.
 * @compile-error
 * @author kaigorodov
 * @reviewer rodionov
 */

class F<S> {
  factory I(S q, S r) {}
}

interface I<S, T> default F<S, T> {
  I(S s, T t);
}

main() {
  try {
    new I<int, String>(null, null);
  } catch(var e) {}
}
