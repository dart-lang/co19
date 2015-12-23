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
 * @description Checks that only the setter in the correct class is found.
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../../Utils/expect.dart';

class A {
  set v(val) {Expect.fail("Wrong setter was invoked");}
}

class B {
  set v(val) {Expect.fail("Wrong setter was invoked");}
}

class C {
  set v(val) {}
}

main() {
  var o = new C();
  o.v = 1;
}
