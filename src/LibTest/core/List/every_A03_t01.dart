/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws [ObjectNotClosureException] if argument is not a function.
 * @description Checks that ObjectNotClosureException exception is thrown if the argument
 * is not a closure.
 * @needsreview not documented
 * @author vasya
 * @reviewer iefremov
 * @reviewer msyabro
 * @reviewer varlax
 */

#import("../../../Utils/dynamic_check.dart");

typedef bool f(var e);

class A {
  A() {}
}

check(var arg) {
  List<String> a = ["1","2","3"];
  try {
    a.every(arg);
    Expect.fail("ObjectNotClosureException expected when calling a.every()");
  } on ObjectNotClosureException catch(e) {}
}
 
main() {
  if(isCheckedMode()) {
    return;
  }
  bool x;
  check(x);
  check(false);
  check(1);
  check("every");
  check([1, 2, 3]);
  check(new A());
  check(null);
}
