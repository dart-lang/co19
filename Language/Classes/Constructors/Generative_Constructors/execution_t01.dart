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
 * @description Checks that the constructor body is executed after all
 * initializers and 'this' reference as well as all instance fields are
 * accessible in the constructor body.
 * @author iefremov
 * @needsreview It seems to be impossible to verify the order initialized
 * variable declarations are processed because we can't invoke any methods
 * there which would help observe the exact sequence. Same about the
 * initializing formals.
 */
import "../../../../Utils/expect.dart";

class C {
  C(this.f) : c = "c", d = "d", e = "e" {
    Expect.equals(1, a, "Instance variable should already be initialized!");
    Expect.equals("You are not paid to think!", this.b,
        "Instance variable should already be initialized!");
    Expect.equals("c", this.c,
        "Instance variable should already be initialized!");
    Expect.equals("d", d, "Instance variable should already be initialized!");
    Expect.equals("e", e, "Instance variable should already be initialized!");
    Expect.equals("f", f, "Instance variable should already be initialized!");
  }

  var e, d, c;
  var f;
  var a = 1;
  final b = "You are not paid to think!";
}

main() {
  var x = new C("f");
}
