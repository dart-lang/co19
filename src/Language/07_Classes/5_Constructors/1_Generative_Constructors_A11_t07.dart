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
 *   d, if d has the form finalConstVarOrType v = e; then the instance variable v
 *   of i is bound to the value of e (which is necessarily a compile-time constant).
 * - Next, any initializing formals declared in the constructor's parameter list are
 *   executed in the order they appear in the program text. 
 * - Then, the constructor's initializers are executed in the order they appear in the program.
 * - After all the initializers have completed, the body of the constructor is executed
 *   in a scope where this is bound to i. Execution of the body begins with execution 
 *   of the body of the superconstructor with respect to the bindings determined by the 
 *   argument list of the superinitializer of k.
 * @description Checks that 'this' is not accessible to initializers: expecting a compile-error
 * when trying to reference (not invoke) an instance method in a constructor's initializer.
 * @compile-error
 * @author rodionov
 * @needsreview Spec doesn't explicitly say it is a compile-time error when 'this' is accessed
 * before it's bound. 
 */


class C {
  C() : v = f {}
  
  var v;
  f() {}
}

main() {
  try {
    var c = new C();
  } catch(var x){}
}