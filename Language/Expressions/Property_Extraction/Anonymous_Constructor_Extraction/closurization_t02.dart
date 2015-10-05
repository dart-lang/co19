/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a property extraction i of the form new T#
 * proceeds as follows:
 * ...
 * Otherwise, i evaluates to the closurization of the anonymous constructor
 * of type T
 * @description Check extracted constructor evaluates to the closurization
 * of anonymous constructor of type T. Test superclass
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class A {
  String creator;

  A() {
    this.creator = "A";
  }

  A.m() {
    this.creator = "A.m";
  }
}

class C extends A {
  C() : super.m() {
    this.creator = "C";
  }
  C.m() : super.m() {
    this.creator = "C.m";
  }
}

main() {
  var i1 = new C#;
  var o1 = i1();
  Expect.isTrue(o1 is C);
  Expect.equals("C", o1.creator);

  var i2 = new A#;
  var o2 = i2();
  Expect.isTrue(o2 is A);
  Expect.isFalse(o2 is C);
  Expect.equals("A", o2.creator);

}
