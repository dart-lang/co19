/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of i is the declared return type of T.m, if
 * T.m exists; otherwise the static type of i is Dynamic.
 * @description Checks that the static type of a getter invocation expression
 * is the declared return type of the getter.
 * @author msyabro
 * @reviewer rodionov
 */

class A {
  int get v() {}
}

class B {
  bool get v() {}
}

class C {
  String get v() {}
}

main()  {
  var classWithGetter;

  classWithGetter = new A();
  int resInt = classWithGetter.v;

  classWithGetter = new B();
  bool resBool = classWithGetter.v;

  classWithGetter = new C();
  String resString = classWithGetter.v;
}
