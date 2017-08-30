/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Otherwise, the body of f is executed with this bound to o. The
 * value of i is the result returned by the call to the getter function.
 * @description Checks that the getter in superclass is called with this bound
 * to the current value of this and the result is the result of supper.m
 * @author ilya, sgrekhov@unipro.ru
 * @issue 30573
 */
import '../../../../Utils/expect.dart';

@proxy
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
