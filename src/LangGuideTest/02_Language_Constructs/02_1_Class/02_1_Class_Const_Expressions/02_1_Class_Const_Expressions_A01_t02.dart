/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion User-defined objects can be constructed as constant expressions by using constant 
 * constructors. These constructors are prefixed with const and have no constructor body. 
 * @description Checks that const constructor can not have a body.
 * @author iefremov
 * @compile-error
 * @reviewer msyabro
 */

class A {
  const A() {};
}

void main() {}
