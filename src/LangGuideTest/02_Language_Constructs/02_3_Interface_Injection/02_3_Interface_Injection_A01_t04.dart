/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Dart allows injection of interfaces into a class or interface.
 * The type checker validates that the class actually implements the interface.
 * @description Checks that it is not possible to inject the unknown type.
 * @author iefremov
 * @compile-error
 * @reviewer msyabro
 */

interface I {
  void f();
}

interface I extends UnknownInterface;


void main() {
}
