/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An interface I inherits any members of its superinterfaces that 
 * are not overridden by members declared in I.
 * @description Checks that there're no static warnings produced when attempting to access
 * the inherited non-static members of a null variable whose static type is an interface
 * extending another interface that declares those members. This should indirectly prove
 * that they're indeed inherited by the subinterface.
 * @static-clean
 * @author rodionov
 * @reviewer kaigorodov
 */
import "../../../Utils/expect.dart";

abstract class I1 {
  int foo;
  String bar;
  void m();
  int get gett0r;
  void set sett0r(int v);
  I1 operator+(int i);
}

abstract class I2 extends I1 {}

abstract class I3 extends I2 {}

check(func) {
  try {
    func();
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch(ok) {}
}

main() {
  I2 i2 = null;
  I3 i3 = null;
  
  check(() {i2.foo;});
  check(() {i2.bar;});
  check(() {i2.m();});
  check(() {i2.gett0r;});
  check(() {i2.sett0r = 1;});
  check(() {i2 + 1;});
  check(() {i3.foo;});
  check(() {i3.bar;});
  check(() {i3.m();});
  check(() {i3.gett0r;});
  check(() {i3.sett0r = 1;});
  check(() {i3 + 1;});
}
