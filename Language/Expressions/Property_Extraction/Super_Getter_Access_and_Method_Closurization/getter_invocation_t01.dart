/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a property extraction i of the form super.m
 * proceeds as follows:
 * ...
 * Otherwise, i is a getter invocation. Let f be the result of looking up
 * getter m in Sdynamic with respect to L. The body of f is executed with this
 * bound to the current value of this. The value of i is the result returned
 * by the call to the getter function.
 * @description Check that the body of getter f is executed with this bound to
 * the current value of this.
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class A {
  String get className => "A";
  bool executed = false;
  int get m {
    this.executed = true;
    Expect.equals(this.className, "C");
    return 1;
  }
}

class C extends A {
  String get className => "C";
  int get m => 2;

  void test() {
    var f = super.m;
    Expect.isTrue(this.executed, "Getter body should be executed");
  }
}

main() {
  C c = new C();
  c.test();
}
