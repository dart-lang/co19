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
 * @description Checks that the getter in supercalss is called with this bound
 * to the current value of this and the result is the result of supper.m
 * @static-warning
 * @author ilya
 */
import '../../../Utils/expect.dart';

class S {
  get field => this.x + 1; // static warning
}

class C extends S {
  var x;
  C(this.x);
  test() => super.field;
}

main() {
  Expect.equals(2, new C(1).test());
}