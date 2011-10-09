/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The formal parameters of a method is a (possibly empty) list of positional
 * parameters optionally followed by either a rest parameter or a section with named
 * optional parameters.
 * @description Checks rest parameters.
 * @author pagolubev
 * @reviewer iefremov
 */

class A {
  static f1(...z) { 
    return z;
  }

  f2(...z) {
    return z;
  }

  A() {}
}


void arrayEquals(Array expected, Array actual) {
  Expect.isTrue(expected.length == actual.length);
  for(var i = 0; i < expected.length; i+=1) {
    Expect.isTrue(expected[i] === actual[i]);
    Expect.isTrue(expected[i] == actual[i]);
  }
}

void main() {
  void f3(...z) {
    return z;
  }

  A z = new A();
  Array a = [null, 1, 2, 3, null, z];
  
  arrayEquals(a, A.f1(null, 1, 2, 3, null, z));
  arrayEquals(a, new A().f2(null, 1, 2, 3, null, z));
  arrayEquals(a, f3(null, 1, 2, 3, null, z));

  arrayEquals(a, A.f1(a)[0]);
  arrayEquals(a, new A().f2(a)[0]);
  arrayEquals(a, f3(a)[0]);
}
