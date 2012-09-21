/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws [ObjectNotClosureException] if argument is not a valid comparator function.
 * @description Checks that ObjectNotClosureException exception is thrown.
 * @author vasya
 * @reviewer iefremov
 * @reviewer msyabro
 */

#import("../../../Utils/dynamic_check.dart");

typedef bool f(var e);

class A {
  A() {}
}

checkList(list, arg) {
  try {
    list.some(arg);
    Expect.fail("ObjectNotClosureException expected when calling a.every()");
  } on ObjectNotClosureException catch(e) {}
}

check(var arg) {
  checkList(["1","2","3"], arg);
  checkList(const ["1","2","3"], arg);
  checkList(new List.from(["1","2","3"]), arg);

  var a = new List(3);
  a.setRange(0, 3, ["1","2","3"]);
  checkList(a, arg);

  var b = new List();
  b.addAll(["1","2","3"]);
  checkList(b, arg);
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
}
