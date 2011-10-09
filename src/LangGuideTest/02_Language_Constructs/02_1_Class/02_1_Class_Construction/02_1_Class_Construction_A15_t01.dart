/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a class has two constructors, one cannot call the other 
 * constructor in its initializer list.
 * @description Checks calling another constructor in the initializer list.
 * @author iefremov
 * @compile-error
 * @reviewer msyabro
 */

class A {
  A() {}
  A.c2() : A() {}
}

void main() {}
