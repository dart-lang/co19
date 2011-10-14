/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A regular instance-method invocation is of the form: expr.id(arg1, ..., argN).
 * @description Check instance-method invocation
 * @author msyabro
 * @reviewer akuznecov
 */

class A {
  A() {}
  void func(var v1, var v2) {}
}


main() {
  A a = new A();
  a.func(1,1);
}
