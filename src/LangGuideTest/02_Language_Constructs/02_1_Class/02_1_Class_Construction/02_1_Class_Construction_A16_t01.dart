/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Prefixing a constructor with word 'factory' turns the constructor into a
 * factory constructor. A factory constructor is responsible for creating the actual instance.
 * @description Checks some basic example.
 * @author iefremov
 * @reviewer msyabro
 */

class A {
  factory A() {
    return null;
  }
}


void main() {
  Expect.isTrue(null == new A());
}
