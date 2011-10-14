/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Applies the function [f] for each element of the list.
 * @description Tries to pass argument [f] which is not a function.
 * @author vasya
 * @needsreview
 * @reviewer msyabro
 */

typedef bool f(var e);

class A {
  A() {}
}

check(var arg) {
  List<String> a = ["1","2","3"];
  try {
    a.forEach(arg);
    Expect.fail("ObjectNotClosureException expected when calling a.every()");
  } catch(ObjectNotClosureException e) {}
}
 
main() {
  
  check(null);

  bool x;
  check(x);
  check(false);
  check(1);
  check("every");
  check(new Promise<f>());
  check([1, 2, 3]);
  check(new A());
}