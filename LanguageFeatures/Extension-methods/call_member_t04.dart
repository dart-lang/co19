/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Any expression of the form e1(args) or e1<types>(args) where e1
 * does not denote a method, and where the static type of e1 is not a function
 * type, an interface type declaring a call method, or dynamic, will currently
 * be a compile-time error. If the static type of e1 is an interface type
 * declaring a call getter, then this stays a compile-time error. Otherwise we
 * check for extensions applying to the static type of e1 and declaring a call
 * member. If one such most specific extension exists, and it declares a call
 * extension method, then the expression is equivalent to e1.call(args) or
 * e1.call<typeS>(args). Otherwise it is still a compile-time error.
 *
 * @description Check that it is a compile error if there is e1 is an interface
 * with 'call' getter
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods

class A {
  String get call => "My name is A";
}

extension on int {
  String get call => "My name is int";
}

extension on num {
  String get call => "My name is num";
}


main() {
  1(10);          //# 01: compile-time error
  1("10");        //# 02: compile-time error
  1.0(10);        //# 03: compile-time error
  1.0("10");      //# 04: compile-time error
  A a = new A();
  a(2);           //# 05: compile-time error
  a(2, "3");      //# 06: compile-time error
}
