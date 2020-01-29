/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression of the form e! evaluates e to a value v, throws a
 * runtime error if v is null, and otherwise evaluates to v.
 *
 * @description Check that an expression of the form e! evaluates e to a value
 * v, throws no runtime error if v is not null. Test 'super'
 * @author sgrekhov@unipro.ru
 * @issue 39723
 * @issue 39598
 * @issue 40372
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

class A {
  String s = "Show must go on";
  foo() {}
  Object? get getValue => "Lily was here";
  int? operator [](int index) => index;
  void operator []=(int index, String val) {
    s = val;
  }
}

class C extends A {
  test() {
    super!;          //# 01: static type warning
    super!.foo();    //# 02: static type warning
    super![42];      //# 03: static type warning
    super!?.foo();   //# 04: static type warning
    super!?.[42];    //# 05: static type warning
    super!.s = "Lily was here";    //# 06: static type warning
    super!?.s = "Lily was here";   //# 07: static type warning
    super![0] = "Lily was here";   //# 08: static type warning
    super!?.[0] = "Lily was here"; //# 09: static type warning
    super.getValue!;
    super[42]!;
  }
}

main() {
  C c = new C();
  c.test();
}
