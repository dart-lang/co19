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
 * @description Checks that superconstructor intializers and superconstructor
 * body are executed in the correct order and before the body of this class's
 * constructor.
 * @author iefremov
 */
import "../../../../Utils/expect.dart";

var log;

writeLog(var x) {
  log = '$log$x';
}

class C {
  C(this.a, this.b) : y = writeLog("y"), x = writeLog("x") {
    writeLog("C");
    Expect.equals("a", a, "Instance variable must be already initialized!");
    Expect.equals("b", b, "Instance variable must be already initialized!");
  }

  C.named(this.a, this.b) : y = writeLog("y"), x = writeLog("x") {
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
  D() :  d4 = writeLog("d4"), d3 = writeLog("d3"), super("a", "b") {
    writeLog("D");
  }

  D.named() :  d4 = writeLog("d4"), d3 = writeLog("d3"), super.named("a", "b") {
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
  Expect.equals("d4d3yxC.namedD.named", log);

  log = "";
  d = new D.rdr();
  Expect.equals("d4d3yxCD", log);
}
