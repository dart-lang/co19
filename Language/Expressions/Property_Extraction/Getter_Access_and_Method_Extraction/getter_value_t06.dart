/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Otherwise, the body of f is executed with this bound to o. The
 * value of i is the result returned by the call to the getter function.
 * @description Checks that it is a compile error if the getter in superclass is
 * called with this bound to the current value of this and the result is the
 * result of supper.m
 * @compile-error
 * @author ilya
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class A {
  get field => this.x + 1;
}

class C extends A {
  var x;
  C(this.x);
  test() => super.field;
}

main() {
  Expect.equals(2, new C(1).test());
}
