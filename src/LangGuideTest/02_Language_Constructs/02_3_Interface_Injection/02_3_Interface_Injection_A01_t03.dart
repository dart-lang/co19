/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Dart allows injection of interfaces into a class or interface.
 * The type checker validates that the class actually implements the interface.
 * @description Checks that cyclic interface to interface injection is not allowed.
 * @author iefremov
 * @compile-error
 * @reviewer msyabro
 */

interface I {
  void f();
}

interface I extends I;


void main() {
}
