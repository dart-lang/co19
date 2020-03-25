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
 * v, throws no runtime error if v is not null. Test identifier
 * @author sgrekhov@unipro.ru
 * @issue 39723
 * @issue 41193
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

main() {
  A? a = new A();
  a!;
  a!.foo();                       //# 01: static type warning
  a![42];                         //# 02: static type warning
  a!?.foo();                      //# 03: static type warning
  a!?[42];                        //# 04: static type warning
  a!.s = "Lily was here";         //# 05: static type warning
  a!?.s = "Let it be";            //# 06: static type warning
  a![0] = "Lily was here";        //# 07: static type warning
  a!?[0] = "Lily was here";       //# 08: static type warning
  if (a != null) {
    a.getValue!;
    a[42]!;
  }
}
