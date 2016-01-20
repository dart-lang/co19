/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let Sstatic be the superclass of the immediately enclosing class.
 * ...
 * If Sstatic.m does not exist, or if F is not a function type, the static
 * type of i is Dynamic; otherwise the static type of i is the declared return
 * type of F.
 * @description Checks that the static type of a method invocation is the
 * declared return type of F.
 * @static-clean
 * @author msyabro
 * @reviewer kaigorodov
 */

class S {
  int f1() {}
  bool f2() {}
  String f3() {}
  S f4() {}
}

class A extends S {
  test() {
    int resultInt = super.f1();
    bool resultBool = super.f2();
    String resultString = super.f3();
    S resultC = super.f4();
  }
}

main() {
  new A().test();
}
