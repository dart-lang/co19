/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the getter lookup has failed, then a new instance im of the
 * predefined class Invocation is created, such that:
 * • im.isGetter evaluates to true.
 * • im.memberName evaluates to the symbol m.
 * • im.positionalArguments evaluates to the value of const [].
 * • im.namedArguments evaluates to the value of const {}.
 * Then the method noSuchMethod() is looked up in Sdynamic and invoked with
 * argument im, and the result of this invocation is the result of evaluating i.
 * @description Checks that if a lookup has failed, then noSuchMethod() is
 * looked up and called in a superclass with correct Invocation instance
 * and the result of this call is the result of super.m.
 * @static-warning
 * @author ilya, sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class A {
  bool called = false;

  noSuchMethod(Invocation im) {
    called = true;
    Expect.isTrue(im.isGetter);
    Expect.equals(const Symbol('unknown'), im.memberName);
    Expect.listEquals([], im.positionalArguments);
    Expect.throws(() => im.positionalArguments.clear());
    Expect.mapEquals({}, im.namedArguments);
    Expect.throws(() => im.namedArguments.clear());
    return 1;
  }
}

class C extends A {
  void test() {
    Expect.equals(1, super.unknown); /// static type warning
  }
}

main() {
  C o = new C();
  o.test();
  Expect.isTrue(o.called);
}
