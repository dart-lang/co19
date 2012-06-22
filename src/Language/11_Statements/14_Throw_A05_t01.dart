/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The current stack trace is an object whose toString() method 
 * produces a string that is a record of exactly those function activations 
 * within the current isolate that had not completed execution at the point 
 * where the current exception was thrown.
 * @description Checks that the string representation of the current stack trace indeed 
 * contains the names of functions whose execution was aborted by the current exception 
 * and they're mentioned in the specified order (assuming it's innermost first).
 * @author rodionov
 */

function1() {
  () {throw "hey you!";}();
}

typedef funken();

class S {
  void function2(funken f) {
    f();
  }
}
 
class C extends S {
  static function3() {
    new C().function2(function1);
  }
}

main() {
  function4() {
    C.function3();
  }
  
  try {
    function4();
  } catch (var ex, var trace) {
    String traceStr = trace.toString();
    int idx1 = traceStr.indexOf("function1"), 
      idx2 = traceStr.indexOf("function2"), 
      idx3 = traceStr.indexOf("function3"),
      idx4 = traceStr.indexOf("function4"),
      idx5 = traceStr.indexOf("main");
    
    Expect.isTrue(idx1 >= 0);
    Expect.isTrue(idx2 > 0);
    Expect.isTrue(idx3 > 0);
    Expect.isTrue(idx4 > 0);
    Expect.isTrue(idx5 > 0);
    Expect.isTrue(idx1 < idx2);
    Expect.isTrue(idx2 < idx3);
    Expect.isTrue(idx3 < idx4);
    Expect.isTrue(idx4 < idx5);
  }
}
