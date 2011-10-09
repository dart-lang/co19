/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A static-method invocation is of the form: className.id(arg1, ..., argN).
 * @description Check that static-method invocation is a valid expression
 * @author msyabro
 * @reviewer akuznecov
 */

class A {
  static void func(var x, var y) {}
}


void main() {
  A.func(1, 1);
}
