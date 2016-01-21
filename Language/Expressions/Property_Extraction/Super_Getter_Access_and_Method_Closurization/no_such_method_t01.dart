/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
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
 * @description Check that if getter lookup failed and object has
 * noSuchMethod() then this method called with Invocation as agrument
 * with properties set to the values listed in the assertion.
 * @issue 24331
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class A {
  bool called = false;

  void noSuchMethod(Invocation i) {
    called = true;
    Expect.isTrue(i.isGetter);
    Expect.equals(new Symbol('someGetter'), i.memberName);
    Expect.equals(const[], i.positionalArguments);
    Expect.equals(const{}, i.namedArguments);
  }
}

class C extends A {
  void test() {
    super.someGetter; /// static type warning
  }
}

main() {
  C o = new C();
  o.test();
  Expect.isTrue(o.called);
}
