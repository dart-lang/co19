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
 * @description Checks that superconstructor intializers and superconstructor body
 * are executed in the correct order and before the body of this class's constructor.
 * @author iefremov
 * @reviewer rodionov
 */

var log;

writeLog(var x) {
  log += x;
}

class C {
  C(this.a, this.b) : y=writeLog("y"), x=writeLog("x") {
    writeLog("C");
    Expect.equals("a", a, "Instance variable must be already initialized!");
    Expect.equals("b", b, "Instance variable must be already initialized!");
  }

  C.named(this.a, this.b) : y=writeLog("y"), x=writeLog("x") {
    writeLog("C.named");
    Expect.equals("a", a, "Instance variable must be already initialized!");
    Expect.equals("b", b, "Instance variable must be already initialized!");
  }

  C.rdr(a, b) : this(a, b);

  var a;
  var b;

  var x;
  var y;
}

class D extends C {
  D() :  d4=writeLog("d4"), d3=writeLog("d3"), super("a", "b"){
    writeLog("D");
  }

  D.named() :  super.named("a", "b"), d4=writeLog("d4"), d3=writeLog("d3") {
    writeLog("D.named");
  }

  D.rdr() : this();

  var d3;
  var d4;
}

main() {
  log = "";
  var d = new D();
  Expect.equals("d4d3yxCD", log);

  log = "";
  d = new D.named();
  Expect.equals("yxd4d3C.namedD.named", log);

  log = "";
  d = new D.rdr();
  Expect.equals("d4d3yxCD", log);
}
