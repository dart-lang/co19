/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error if the number of arguments is different between a function and the overriden function.
 * @description Checks that it is an error if an overriden function has less arguments
 * than the function it overrides.
 * @compile-error
 * @author msyabro
 * @reviewer pagolubev
 */

class A {
  void func(int x) {}
}

class B extends A {
  void func() {}
}


void main() {}
