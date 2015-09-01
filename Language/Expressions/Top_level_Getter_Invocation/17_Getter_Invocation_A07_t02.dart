/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of super getter invocation i of the form super.m
 * proceeds as follows:
 * Let S be the superclass of the immediately enclosing class. The getter
 * function m is looked up in S with respect to the current library, and
 * its body is executed with this bound to the current value of this.
 * The value of the getter invocation expression is the result returned by
 * the call to the getter function.
 * If the getter lookup has failed, then a new instance im of the predefined
 * class Invocation is created, such that:
 *  · im.isGetter evaluates to true.
 *  · im.memberName evaluates to 'm'.
 *  · im.positionalArguments evaluates to the value of const [].
 *  · im.namedArguments evaluates to the value of const {}.
 * Then the method noSuchMethod() is looked up in S and invoked with argument
 * im, and the result of this invocation is the result of evaluating i.
 * @description Checks that if a lookup has failed, then noSuchMethod() is
 * looked up and called in a superclass with correct Invocation instance
 * and the result of this call is the result of super.m
 * @static-warning
 * @author ilya
 */
import '../../../Utils/expect.dart';

class S {
  noSuchMethod(Invocation im) {
    Expect.isTrue(im.isGetter);
    Expect.equals(const Symbol('unknown'), im.memberName);
    Expect.listEquals([], im.positionalArguments);
    Expect.throws(() => im.positionalArguments.clear());
    Expect.mapEquals({}, im.namedArguments);
    Expect.throws(() => im.namedArguments.clear());
    return 123;
  }
}

class C extends S {
  test() {
    Expect.equals(123, super.unknown); // static warning
  }
}

main() {
  new C().test();
}