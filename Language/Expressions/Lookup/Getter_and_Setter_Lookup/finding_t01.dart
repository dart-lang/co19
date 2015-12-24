/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The result of a lookup of a getter (respectively setter) m in
 * object o with respect to library L is the result of looking up getter
 * (respectively setter) m in class C with respect to L, where C is the class
 * of o.
 * @description Checks that only the getter in the correct class is found.
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../../Utils/expect.dart';

class A {
  get v {Expect.fail("Wrong getter was invoked");}
}

class B {
  get v {Expect.fail("Wrong getter was invoked");}
}

class C {
  get v {}
}

main() {
  var o = new C();
  o.v;
}
