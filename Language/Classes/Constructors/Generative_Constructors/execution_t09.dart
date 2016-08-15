/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Execution of a generative constructor k is always done with
 * respect to a set of bindings for its formal parameters and with this bound
 * to a fresh instance i and the type parameters of the immediately enclosing
 * class bound to a set of actual type arguments V1, ... , Vm.
 * If k is redirecting then its redirect clause has the form
 *   this.g(a1, ..., an, xn+1: an+1, ..., xn+k: an+k)
 * where g identifies another generative constructor of the immediately
 * surrounding class. Then execution of k proceeds by evaluating the argument
 * list (a1, ..., an, xn+1: an+1, ..., xn+k: an+k) and then executing g with
 * respect to the bindings resulting from the evaluation of (a1, ..., an, xn+1:
 * an+1, ..., xn+k: an+k) and with this bound to i and the type parameters of
 * the immediately enclosing class bound to V1, ... , Vm.
 * Otherwise, execution  proceeds as follows:
 * Any initializing formals declared in k's parameter list are executed in the
 * order they appear in the program text. Then, k's initializers are executed
 * in the order they appear in the program.
 * After all the initializers have completed, the body of k is executed in a
 * scope where this is bound to i. Execution of the body begins with execution
 * of the body of the superconstructor with this bound to i, the type
 * parameters of the immediately enclosing class bound to a set of actual type
 * arguments V1, ... , Vm and the formal parameter bindings determined by the
 * argument list of the superinitializer of k.
 * @description Checks that 'this' is not accessible in the right-hand side of
 * an initialized instance variable declaration (e.g. a variable can't be
 * initialized using another variable).
 * @compile-error
 * @author msyabro
 */

class C {
  const C();

  final x = 1;
  final y = x;
}

main() {
  try {
    var c = const C();
  } catch (e) {}
}
