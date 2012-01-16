/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Execution of a generative constructor proceeds as follows:
 * - First, a fresh instance (7.5.1) i of the immediately enclosing class is allocated.
 * - Next, the instance variable declarations of the immediately enclosing class are
 *   visited in the order they appear in the program text. For each such declaration
 *   d, if d has the form finalVarOrType v = e; then the instance variable v
 *   of i is bound to the value of e (which is necessarily a compile-time constant).
 * - Next, any initializing formals declared in the constructor's parameter list are
 *   executed in the order they appear in the program text. 
 * - Then, the constructor's initializers are executed in the order they appear in the program.
 * - After all the initializers have completed, the body of the constructor is executed
 *   in a scope where this is bound to i. Execution of the body begins with execution 
 *   of the body of the superconstructor with respect to the bindings determined by the 
 *   argument list of the superinitializer of k.
 * @description Checks that the constructor body is executed after all initializers and
 * this reference as well as all instance fields are accessible to that code by that time.
 * @author iefremov
 * @reviewer rodionov
 * @needsreview It seems to be impossible to verify the order initialized variable 
 * declarations are processed because we can't invoke any methods there which would help 
 * observe the exact sequence. Same about the initializing formals.

 */

class C {
  C(this.f) : c = "c", d = "d", e = "e" {
    Expect.equals(1, a, "Instance variable should already be initialized!");
    Expect.equals("You are not paid to think!", this.b, "Instance variable should already be initialized!");
    Expect.equals("c", this.c, "Instance variable should already be initialized!");
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
