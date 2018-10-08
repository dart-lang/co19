/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if the static type F of ef may not
 * be assigned to a function type.
 * @description Checks that there is no static warning when the static type of
 * ef is Object, dynamic or bottom.
 * @static-clean
 * @author rodionov
 */
import '../../../../Utils/expect.dart';

var foo;
var nullvar = null;

class A {
  var field;

  A() {
    field = "field";
  }

  get getter {
    return "foo";
  }
}

f() {
  return {"key": "value"};
}

main() {
  foo = 1;
  Expect.throws(() => foo(null, 1, 2));
  Expect.throws(() => nullvar(null, 1, 2));
  Expect.throws(() => (new A()).getter(null, 1, 2));
  Expect.throws(() => (new A()).field("foo", "bar"));

  try {
    Function func;
    func();
    Expect.fail("NoSuchMethodError is expected");
  } on NoSuchMethodError catch (e) {}

  try {
    dynamic o1;
    o1();
    Expect.fail("NoSuchMethodError is expected");
  } on NoSuchMethodError catch (e) {}

  try {
    f()(); // declared return type is dynamic
    Expect.fail("NoSuchMethodError is expected");
  } on NoSuchMethodError catch (e) {}
}
